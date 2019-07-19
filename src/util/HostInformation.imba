export class HostInformation

	def initialize
			const host = process:env.HOST_NAME or "localhost"
			const protocol = host.includes("localhost") ? "http" : "https"

			@port = process:env.SERVER_PORT or 8080
			@fullPath = "{protocol}://{host}:{@port}"