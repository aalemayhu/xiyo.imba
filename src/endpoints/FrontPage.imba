import App from '../components/App'

export class FrontPage

	def initialize req, res
		let data = {
			shortened: req:query:v,
			visits: req:query:visits
		}
		var node = <html router-url=req:path>
			<head>
				<meta charset="utf-8">
				<meta name="viewport" content="width=device-width, initial-scale=1">
				<link rel="stylesheet" href="./dist/index.css">
				<title>	"XIYO.no - URL shortener written in Imba"
				<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css">
				<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js">
				<link rel="shortcut icon" type="image/x-icon" href="favicon.ico">
			<body>
				<App[data]>
		
		node.router.onReady do
			res.send node.toString