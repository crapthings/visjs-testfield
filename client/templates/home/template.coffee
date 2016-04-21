_ = lodash

faker = require 'faker'

Template.home.viewmodel

	onRendered: ->

		iconsets = [
			'anchor'
			'at'
			'ban'
			'asterisk'
			'bars'
			'fax'
			'bomb'
			'cab'
			'cloud'
			'comment'
			'compass'
			'copyright'
		]

		container = ($ '#vis')[0]

		timeline = new vis.Timeline container

		groups = _.times 5, (n) -> {
			id: faker.random.uuid()
			content: do faker.lorem.word
		}

		items = _.times 20, (n) -> {
			id: n + 1
			group: (_.sample groups).id
			content: """
				<span class="fa-stack fa-lg">
					<i class='fa fa-circle fa-stack-2x'></i>
					<i class='fa fa-#{_.sample(iconsets)} fa-stack-1x fa-inverse'></i>
				</span>
				<div style='position: relative;'>#{faker.lorem.word()}</div>
			"""
			start: moment(new Date faker.date.recent(365)).format 'YYYY-MM-DD'
			type: _.sample ['box']
		}

		timeline.setGroups groups

		timeline.setItems items

		timeline.setOptions {
			orientation: 'top'
			stack: false
			height: '500px'
		}