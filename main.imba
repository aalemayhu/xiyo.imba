#!/usr/bin/env imba

import 'imba-router'

import RedirectHandler from './src/endpoints/RedirectHandler'
import CreateHandler from './src/endpoints/CreateHandler'
import FrontPage from './src/endpoints/FrontPage'
import HostInformation from './src/util/HostInformation'

const chalk = require 'chalk'
const express = require 'express'

const app = express()
app.use(express.static('./'))

# GET /:id
app.get('/:id') do |req,res|
	RedirectHandler(req, res)

# POST /create
app.post('/create/') do |req,res|
	CreateHandler(req, res)

# GET / 
app.get(/.*/) do |req,res|
	FrontPage.new(req, res)

const host = HostInformation.new
app.listen(host@port) do console.log("Listening on {chalk.green host@fullPath}")