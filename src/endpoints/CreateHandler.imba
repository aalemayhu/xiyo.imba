import HostInformation from '../util/HostInformation'
import Database from '../util/Database'

def lookupUrl db, url
	let matchRes = await db.psql 'lookup-url', 'SELECT id,visits FROM urls WHERE url = $1', [url]
	if matchRes and matchRes:rows and matchRes:rows:length == 1
		return matchRes:rows[0]
	else
		return null

export def CreateHandler req, res
	let db = Database.new
	
	# Bad input
	if !req:query:url
		console.log "missing url"
		res.status(400)
		return

	# Check if the url has already been registered
	let url = req:query:url
	let exists = await lookupUrl(db, url)
	if !exists
		# Otherwise create the url
		let qRes = await db.psql 'create-new', 'INSERT INTO urls (url, created_on) VALUES($1, $2)', [url, Date.new]
		if !qRes
			res.status(500).send
			return
	# Check if the url was created
	let match = await lookupUrl(db, url)
	if match
		let host = HostInformation.new
		let shortened = "{host@fullPath}/{match:id}"
		res.redirect("/shortened?v={shortened}&visits={match:visits}")
	else
		console.log "bad id {id} for lookup {url}"
		res.status(400).send

