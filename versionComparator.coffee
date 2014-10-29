###
Copyright (C) 2013 - 2014 Tim Düsterhus

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
###

fs = require 'fs'
jison = require 'jison'

grammar = fs.readFileSync "#{__dirname}/versionComparator.jison", 'utf8'
parser = new jison.Parser grammar
debug = (require 'debug')('PackageServer:versionComparator')

module.exports = (comparison) ->
	# normalize comparison string
	comparison = parser.parse comparison
	
	debug "Result: #{comparison.replace /\s+/g, ' '}"
	new Function '$v', comparison
