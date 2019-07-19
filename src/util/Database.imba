const pg = require 'pg'

export class Database

	def initialize		
		# TODO: move db stuff into own class
		const PGHOST = process:env.PGHOST or 'localhost'
		const PGUSER = process:env.PGUSER or 'xiyo'
		const PGDATABASE = process:env.PGDATABASE or 'xiyo'
		const PGPASSWORD = process:env.PGPASSWORD or 'sushi-something'
		const PGPORT = process:env.PGPORT or 5432

		@pool = pg.Pool({
			user: PGUSER,
			host: PGHOST,
			database: PGDATABASE,
			password: PGDATABASE
			port: PGPORT,
		})



	# Convience method to reduce copy / pasta
	def psql name, text, values
		const query = {
			name: name,
			text: text,
			values: values
		}

		Promise.new do |resolve|
			setTimeout(&,1000) do
				@pool.query(query) do |err, res|
					if err
						console.error err
					resolve(res)