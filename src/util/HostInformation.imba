export class HostInformation

	def initialize
			const host = process:env.HOST_NAME or "localhost"
			@port = process:env.SERVER_PORT or 8080
			@fullPath = host.includes("localhost") ? "http://{host}:{@port}" : "https://{host}"
