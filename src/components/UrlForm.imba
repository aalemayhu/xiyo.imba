export tag UrlForm < form

	def render
		<self action="/create/">
			<div.field.has-addons>
				<div.control.is-expanded>
					<input@input.input.is-large type='url' name='url' placeholder='Enter your URL here'>
				<div.control>
					<button.button.is-link.is-large> "Shorten"