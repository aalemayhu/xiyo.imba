import CreateHandler from './CreateHandler'
import Database from '../util/Database'
import FrontPage from './FrontPage'

export def RedirectHandler req, res
	let db = Database.new

	if req:originalUrl.includes "create"
		CreateHandler(req, res)
		return
	else if req:originalUrl.includes "shortened"
		FrontPage.new(req, res)
		return

	let id = req:params:id
	if !id
		res.status(500).send
	else
		let lookupId = await db.psql 'lookup-id', 'SELECT * FROM urls WHERE id = $1', [id]
		if !lookupId
			res.status(500).send				
		else if lookupId and lookupId:rows and lookupId:rows:length == 1
			let target = lookupId:rows[0]:url
			console.log "Redirecting to ",target
			await db.psql 'update-visits', 'UPDATE urls SET visits = visits + 1 WHERE id = $1', [id]
			res.redirect(target)
		else
			res.status(400).send
