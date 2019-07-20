export tag UrlForm < form

	def render
		<self action="/create/">
			<div.field.has-addons>
				<div.control.is-expanded>
					<input@input.input type='url' name='url' placeholder='Enter your URL here' css:width='256px'>
				<div.control>
					<button.button.is-link> "Shorten"