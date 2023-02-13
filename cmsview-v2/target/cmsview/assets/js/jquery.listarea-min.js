/*!
 * jQuery listarea plugin
 * Original author: Omar Wheatley
 * Copyright 2014 Omar Wheatley
 * Licensed under the MIT license
 * 1.0.0
 */
(function(b,a,c){b.fn.listarea=function(f){f=b.extend({delimiter:",",effect:null,placeholder:"add an item"},f);var e=b(this).hide().after('<div class="addListItem"><input type="text" placeholder="'+f.placeholder+'"/><div class="addButton"></div></div>');var d=b("div.addListItem");b("div.addListItem > .addButton").on("click",function(){lbAddListItem(e,d,f)});b("div.addListItem").on("click","div.listItemWrap .deleteButton",function(){lbDeleteListItem(e,d,b(this),f)});b("div.addListItem > input").on("enterKey",function(){alert("in");return false});b("div.addListItem > input").keyup(function(g){if(g.keyCode==13){alert("in");b(this).trigger("enterKey")}return false});return this}})(jQuery,window);function lbAddListItem(d,a,c){var b=$("div.addListItem > input").val();if(b!=""){d.next("div.addListItem").find("input").val("");$('<div class="listItemWrap"><div class="listItem">'+b+'</div><div class="deleteButton"></div></div>').hide().prependTo(a).show(c.effect);lbListItemToTextArea(d,a,c)}}function lbDeleteListItem(d,b,a,c){a.parent().remove();lbListItemToTextArea(d,b,c)}function lbListItemToTextArea(d,b,c){var a=[];b.find("div.listItem").each(function(){a.push($(this).text())});d.val(a.join(c.delimiter))};