
import UrlForm from './UrlForm'

export tag App

	def render
		<self>
			<section.section>
				<div.container>
					<h1.title> "XIYO"
					if !data:shortened
						<UrlForm>
					else
						<div>
							<h2.subtitle>
								<a>	"{data:shortened}"
							<a href="/"> "Back"
					<hr>
					if data:visits
						<p> "Visits {data:visits}"
					<a.github href="https://github.com/scanf/xiyo.imba"> "GitHub"
					<br>
					<span> 
						"Built with"
						<a href="https://github.com/imba/imba"> " Imba"
