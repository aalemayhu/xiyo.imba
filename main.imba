#!/usr/bin/env imba

import 'imba-router'

import RedirectHandler from './src/endpoints/RedirectHandler'
import CreateHandler from './src/endpoints/CreateHandler'
import HostInformation from './src/util/HostInformation'
import FrontPage from './src/endpoints/FrontPage'
import Database from './src/util/Database'

const bodyParser = require 'body-parser'
const chalk = require 'chalk'
const express = require 'express'

const BUGSNAG_ID = process:env:BUGSNAG_ID
let app

if BUGSNAG_ID
	const bugsnag = require '@bugsnag/js'
	const bugsnagExpress = require '@bugsnag/plugin-express'
	const bugsnagClient = bugsnag(BUGSNAG_ID)
	bugsnagClient.use(bugsnagExpress)

	app = express()
	const middleware = bugsnagClient.getPlugin('express')
	app.use(middleware:requestHandler)
	app.use(middleware:errorHandler)
else
	app = express()

app.use(express.static('./'))
app.use( bodyParser.json() )

app.use(bodyParser.urlencoded({
	extended: true
})); 


let db = Database.new

# GET /:id
app.get('/:id') do |req,res|
	RedirectHandler(req, res, db)

# POST /create
app.post('/create/') do |req,res|
	CreateHandler(req, res, db)

# GET / 
app.get(/.*/) do |req,res|
	throw new Error('Test error')
	myUndefinedFunction()
	FrontPage.new(req, res, db)

const host = HostInformation.new
app.listen(host@port) do console.log("Listening on {chalk.green host@fullPath}")
