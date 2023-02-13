/*!
 * Datepicker for Bootstrap v1.4.0 (https://github.com/eternicode/bootstrap-datepicker)
 *
 * Copyright 2012 Stefan Petre
 * Improvements by Andrew Rowls
 * Licensed under the Apache License v2.0 (http://www.apache.org/licenses/LICENSE-2.0)
 */
(function(i,e){function m(){return new Date(Date.UTC.apply(Date,arguments))}function f(){var r=new Date();return m(r.getFullYear(),r.getMonth(),r.getDate())}function q(s,r){return(s.getUTCFullYear()===r.getUTCFullYear()&&s.getUTCMonth()===r.getUTCMonth()&&s.getUTCDate()===r.getUTCDate())}function k(r){return function(){return this[r].apply(this,arguments)}}var d=(function(){var r={get:function(s){return this.slice(s)[0]},contains:function(v){var u=v&&v.valueOf();for(var t=0,s=this.length;t<s;t++){if(this[t].valueOf()===u){return t}}return -1},remove:function(s){this.splice(s,1)},replace:function(s){if(!s){return}if(!i.isArray(s)){s=[s]}this.clear();this.push.apply(this,s)},clear:function(){this.length=0},copy:function(){var s=new d();s.replace(this);return s}};return function(){var s=[];s.push.apply(s,arguments);i.extend(s,r);return s}})();var j=function(s,r){this._process_options(r);this.dates=new d();this.viewDate=this.o.defaultViewDate;this.focusDate=null;this.element=i(s);this.isInline=false;this.isInput=this.element.is("input");this.component=this.element.hasClass("date")?this.element.find(".add-on, .input-group-addon, .btn"):false;this.hasInput=this.component&&this.element.find("input").length;if(this.component&&this.component.length===0){this.component=false}this.picker=i(l.template);this._buildEvents();this._attachEvents();if(this.isInline){this.picker.addClass("datepicker-inline").appendTo(this.element)}else{this.picker.addClass("datepicker-dropdown dropdown-menu")}if(this.o.rtl){this.picker.addClass("datepicker-rtl")}this.viewMode=this.o.startView;if(this.o.calendarWeeks){this.picker.find("tfoot .today, tfoot .clear").attr("colspan",function(t,u){return parseInt(u)+1})}this._allow_update=false;this.setStartDate(this._o.startDate);this.setEndDate(this._o.endDate);this.setDaysOfWeekDisabled(this.o.daysOfWeekDisabled);this.setDatesDisabled(this.o.datesDisabled);this.fillDow();this.fillMonths();this._allow_update=true;this.update();this.showMode();if(this.isInline){this.show()}};j.prototype={constructor:j,_process_options:function(r){this._o=i.extend({},this._o,r);var t=this.o=i.extend({},this._o);var u=t.language;if(!b[u]){u=u.split("-")[0];if(!b[u]){u=g.language}}t.language=u;switch(t.startView){case 2:case"decade":t.startView=2;break;case 1:case"year":t.startView=1;break;default:t.startView=0}switch(t.minViewMode){case 1:case"months":t.minViewMode=1;break;case 2:case"years":t.minViewMode=2;break;default:t.minViewMode=0}t.startView=Math.max(t.startView,t.minViewMode);if(t.multidate!==true){t.multidate=Number(t.multidate)||false;if(t.multidate!==false){t.multidate=Math.max(0,t.multidate)}}t.multidateSeparator=String(t.multidateSeparator);t.weekStart%=7;t.weekEnd=((t.weekStart+6)%7);var A=l.parseFormat(t.format);if(t.startDate!==-Infinity){if(!!t.startDate){if(t.startDate instanceof Date){t.startDate=this._local_to_utc(this._zero_time(t.startDate))}else{t.startDate=l.parseDate(t.startDate,A,t.language)}}else{t.startDate=-Infinity}}if(t.endDate!==Infinity){if(!!t.endDate){if(t.endDate instanceof Date){t.endDate=this._local_to_utc(this._zero_time(t.endDate))}else{t.endDate=l.parseDate(t.endDate,A,t.language)}}else{t.endDate=Infinity}}t.daysOfWeekDisabled=t.daysOfWeekDisabled||[];if(!i.isArray(t.daysOfWeekDisabled)){t.daysOfWeekDisabled=t.daysOfWeekDisabled.split(/[,\s]*/)}t.daysOfWeekDisabled=i.map(t.daysOfWeekDisabled,function(B){return parseInt(B,10)});t.datesDisabled=t.datesDisabled||[];if(!i.isArray(t.datesDisabled)){var s=[];s.push(l.parseDate(t.datesDisabled,A,t.language));t.datesDisabled=s}t.datesDisabled=i.map(t.datesDisabled,function(B){return l.parseDate(B,A,t.language)});var v=String(t.orientation).toLowerCase().split(/\s+/g),x=t.orientation.toLowerCase();v=i.grep(v,function(B){return/^auto|left|right|top|bottom$/.test(B)});t.orientation={x:"auto",y:"auto"};if(!x||x==="auto"){}else{if(v.length===1){switch(v[0]){case"top":case"bottom":t.orientation.y=v[0];break;case"left":case"right":t.orientation.x=v[0];break}}else{x=i.grep(v,function(B){return/^left|right$/.test(B)});t.orientation.x=x[0]||"auto";x=i.grep(v,function(B){return/^top|bottom$/.test(B)});t.orientation.y=x[0]||"auto"}}if(t.defaultViewDate){var y=t.defaultViewDate.year||new Date().getFullYear();var w=t.defaultViewDate.month||0;var z=t.defaultViewDate.day||1;t.defaultViewDate=m(y,w,z)}else{t.defaultViewDate=f()}t.showOnFocus=t.showOnFocus!==e?t.showOnFocus:true},_events:[],_secondaryEvents:[],_applyEvents:function(r){for(var s=0,u,t,v;s<r.length;s++){u=r[s][0];if(r[s].length===2){t=e;v=r[s][1]}else{if(r[s].length===3){t=r[s][1];v=r[s][2]}}u.on(v,t)}},_unapplyEvents:function(r){for(var s=0,u,v,t;s<r.length;s++){u=r[s][0];if(r[s].length===2){t=e;v=r[s][1]}else{if(r[s].length===3){t=r[s][1];v=r[s][2]}}u.off(v,t)}},_buildEvents:function(){var r={keyup:i.proxy(function(s){if(i.inArray(s.keyCode,[27,37,39,38,40,32,13,9])===-1){this.update()}},this),keydown:i.proxy(this.keydown,this)};if(this.o.showOnFocus===true){r.focus=i.proxy(this.show,this)}if(this.isInput){this._events=[[this.element,r]]}else{if(this.component&&this.hasInput){this._events=[[this.element.find("input"),r],[this.component,{click:i.proxy(this.show,this)}]]}else{if(this.element.is("div")){this.isInline=true}else{this._events=[[this.element,{click:i.proxy(this.show,this)}]]}}}this._events.push([this.element,"*",{blur:i.proxy(function(s){this._focused_from=s.target},this)}],[this.element,{blur:i.proxy(function(s){this._focused_from=s.target},this)}]);this._secondaryEvents=[[this.picker,{click:i.proxy(this.click,this)}],[i(window),{resize:i.proxy(this.place,this)}],[i(document),{"mousedown touchstart":i.proxy(function(s){if(!(this.element.is(s.target)||this.element.find(s.target).length||this.picker.is(s.target)||this.picker.find(s.target).length)){this.hide()}},this)}]]},_attachEvents:function(){this._detachEvents();this._applyEvents(this._events)},_detachEvents:function(){this._unapplyEvents(this._events)},_attachSecondaryEvents:function(){this._detachSecondaryEvents();this._applyEvents(this._secondaryEvents)},_detachSecondaryEvents:function(){this._unapplyEvents(this._secondaryEvents)},_trigger:function(t,u){var s=u||this.dates.get(-1),r=this._utc_to_local(s);this.element.trigger({type:t,date:r,dates:i.map(this.dates,this._utc_to_local),format:i.proxy(function(v,x){if(arguments.length===0){v=this.dates.length-1;x=this.o.format}else{if(typeof v==="string"){x=v;v=this.dates.length-1}}x=x||this.o.format;var w=this.dates.get(v);return l.formatDate(w,x,this.o.language)},this)})},show:function(){if(this.element.attr("readonly")&&this.o.enableOnReadonly===false){return}if(!this.isInline){this.picker.appendTo(this.o.container)}this.place();this.picker.show();this._attachSecondaryEvents();this._trigger("show");if((window.navigator.msMaxTouchPoints||"ontouchstart" in document)&&this.o.disableTouchKeyboard){i(this.element).blur()}return this},hide:function(){if(this.isInline){return this}if(!this.picker.is(":visible")){return this}this.focusDate=null;this.picker.hide().detach();this._detachSecondaryEvents();this.viewMode=this.o.startView;this.showMode();if(this.o.forceParse&&(this.isInput&&this.element.val()||this.hasInput&&this.element.find("input").val())){this.setValue()}this._trigger("hide");return this},remove:function(){this.hide();this._detachEvents();this._detachSecondaryEvents();this.picker.remove();delete this.element.data().datepicker;if(!this.isInput){delete this.element.data().date}return this},_utc_to_local:function(r){return r&&new Date(r.getTime()+(r.getTimezoneOffset()*60000))},_local_to_utc:function(r){return r&&new Date(r.getTime()-(r.getTimezoneOffset()*60000))},_zero_time:function(r){return r&&new Date(r.getFullYear(),r.getMonth(),r.getDate())},_zero_utc_time:function(r){return r&&new Date(Date.UTC(r.getUTCFullYear(),r.getUTCMonth(),r.getUTCDate()))},getDates:function(){return i.map(this.dates,this._utc_to_local)},getUTCDates:function(){return i.map(this.dates,function(r){return new Date(r)})},getDate:function(){return this._utc_to_local(this.getUTCDate())},getUTCDate:function(){var r=this.dates.get(-1);if(typeof r!=="undefined"){return new Date(r)}else{return null}},clearDates:function(){var r;if(this.isInput){r=this.element}else{if(this.component){r=this.element.find("input")}}if(r){r.val("").change()}this.update();this._trigger("changeDate");if(this.o.autoclose){this.hide()}},setDates:function(){var r=i.isArray(arguments[0])?arguments[0]:arguments;this.update.apply(this,r);this._trigger("changeDate");this.setValue();return this},setUTCDates:function(){var r=i.isArray(arguments[0])?arguments[0]:arguments;this.update.apply(this,i.map(r,this._utc_to_local));this._trigger("changeDate");this.setValue();return this},setDate:k("setDates"),setUTCDate:k("setUTCDates"),setValue:function(){var r=this.getFormattedDate();if(!this.isInput){if(this.component){this.element.find("input").val(r).change()}}else{this.element.val(r).change()}return this},getFormattedDate:function(r){if(r===e){r=this.o.format}var s=this.o.language;return i.map(this.dates,function(t){return l.formatDate(t,r,s)}).join(this.o.multidateSeparator)},setStartDate:function(r){this._process_options({startDate:r});this.update();this.updateNavArrows();return this},setEndDate:function(r){this._process_options({endDate:r});this.update();this.updateNavArrows();return this},setDaysOfWeekDisabled:function(r){this._process_options({daysOfWeekDisabled:r});this.update();this.updateNavArrows();return this},setDatesDisabled:function(r){this._process_options({datesDisabled:r});this.update();this.updateNavArrows()},place:function(){if(this.isInline){return this}var F=this.picker.outerWidth(),B=this.picker.outerHeight(),y=10,I=i(this.o.container).width(),w=i(this.o.container).height(),r=i(this.o.container).scrollTop(),E=i(this.o.container).offset();var v=[];this.element.parents().each(function(){var J=i(this).css("z-index");if(J!=="auto"&&J!==0){v.push(parseInt(J))}});var A=Math.max.apply(Math,v)+10;var u=this.component?this.component.parent().offset():this.element.offset();var z=this.component?this.component.outerHeight(true):this.element.outerHeight(false);var D=this.component?this.component.outerWidth(true):this.element.outerWidth(false);var t=u.left-E.left,x=u.top-E.top;this.picker.removeClass("datepicker-orient-top datepicker-orient-bottom datepicker-orient-right datepicker-orient-left");if(this.o.orientation.x!=="auto"){this.picker.addClass("datepicker-orient-"+this.o.orientation.x);if(this.o.orientation.x==="right"){t-=F-D}}else{if(u.left<0){this.picker.addClass("datepicker-orient-left");t-=u.left-y}else{if(t+F>I){this.picker.addClass("datepicker-orient-right");t=u.left+D-F}else{this.picker.addClass("datepicker-orient-left")}}}var C=this.o.orientation.y,G,s;if(C==="auto"){G=-r+x-B;s=r+w-(x+z+B);if(Math.max(G,s)===s){C="top"}else{C="bottom"}}this.picker.addClass("datepicker-orient-"+C);if(C==="top"){x+=z}else{x-=B+parseInt(this.picker.css("padding-top"))}if(this.o.rtl){var H=I-(t+D);this.picker.css({top:x,right:H,zIndex:A})}else{this.picker.css({top:x,left:t,zIndex:A})}return this},_allow_update:true,update:function(){if(!this._allow_update){return this}var s=this.dates.copy(),t=[],r=false;if(arguments.length){i.each(arguments,i.proxy(function(v,u){if(u instanceof Date){u=this._local_to_utc(u)}t.push(u)},this));r=true}else{t=this.isInput?this.element.val():this.element.data("date")||this.element.find("input").val();if(t&&this.o.multidate){t=t.split(this.o.multidateSeparator)}else{t=[t]}delete this.element.data().date}t=i.map(t,i.proxy(function(u){return l.parseDate(u,this.o.format,this.o.language)},this));t=i.grep(t,i.proxy(function(u){return(u<this.o.startDate||u>this.o.endDate||!u)},this),true);this.dates.replace(t);if(this.dates.length){this.viewDate=new Date(this.dates.get(-1))}else{if(this.viewDate<this.o.startDate){this.viewDate=new Date(this.o.startDate)}else{if(this.viewDate>this.o.endDate){this.viewDate=new Date(this.o.endDate)}}}if(r){this.setValue()}else{if(t.length){if(String(s)!==String(this.dates)){this._trigger("changeDate")}}}if(!this.dates.length&&s.length){this._trigger("clearDate")}this.fill();return this},fillDow:function(){var s=this.o.weekStart,t="<tr>";if(this.o.calendarWeeks){this.picker.find(".datepicker-days thead tr:first-child .datepicker-switch").attr("colspan",function(u,v){return parseInt(v)+1});var r='<th class="cw">&#160;</th>';t+=r}while(s<this.o.weekStart+7){t+='<th class="dow">'+b[this.o.language].daysMin[(s++)%7]+"</th>"}t+="</tr>";this.picker.find(".datepicker-days thead").append(t)},fillMonths:function(){var s="",r=0;while(r<12){s+='<span class="month">'+b[this.o.language].monthsShort[r++]+"</span>"}this.picker.find(".datepicker-months td").html(s)},setRange:function(r){if(!r||!r.length){delete this.range}else{this.range=i.map(r,function(s){return s.valueOf()})}this.fill()},getClassNames:function(t){var r=[],u=this.viewDate.getUTCFullYear(),v=this.viewDate.getUTCMonth(),s=new Date();if(t.getUTCFullYear()<u||(t.getUTCFullYear()===u&&t.getUTCMonth()<v)){r.push("old")}else{if(t.getUTCFullYear()>u||(t.getUTCFullYear()===u&&t.getUTCMonth()>v)){r.push("new")}}if(this.focusDate&&t.valueOf()===this.focusDate.valueOf()){r.push("focused")}if(this.o.todayHighlight&&t.getUTCFullYear()===s.getFullYear()&&t.getUTCMonth()===s.getMonth()&&t.getUTCDate()===s.getDate()){r.push("today")}if(this.dates.contains(t)!==-1){r.push("active")}if(t.valueOf()<this.o.startDate||t.valueOf()>this.o.endDate||i.inArray(t.getUTCDay(),this.o.daysOfWeekDisabled)!==-1){r.push("disabled")}if(this.o.datesDisabled.length>0&&i.grep(this.o.datesDisabled,function(w){return q(t,w)}).length>0){r.push("disabled","disabled-date")}if(this.range){if(t>this.range[0]&&t<this.range[this.range.length-1]){r.push("range")}if(i.inArray(t.valueOf(),this.range)!==-1){r.push("selected")}}return r},fill:function(){var N=new Date(this.viewDate),C=N.getUTCFullYear(),O=N.getUTCMonth(),H=this.o.startDate!==-Infinity?this.o.startDate.getUTCFullYear():-Infinity,L=this.o.startDate!==-Infinity?this.o.startDate.getUTCMonth():-Infinity,z=this.o.endDate!==Infinity?this.o.endDate.getUTCFullYear():Infinity,I=this.o.endDate!==Infinity?this.o.endDate.getUTCMonth():Infinity,A=b[this.o.language].today||b.en.today||"",t=b[this.o.language].clear||b.en.clear||"",v;if(isNaN(C)||isNaN(O)){return}this.picker.find(".datepicker-days thead .datepicker-switch").text(b[this.o.language].months[O]+" "+C);this.picker.find("tfoot .today").text(A).toggle(this.o.todayBtn!==false);this.picker.find("tfoot .clear").text(t).toggle(this.o.clearBtn!==false);this.updateNavArrows();this.fillMonths();var Q=m(C,O-1,28),K=l.getDaysInMonth(Q.getUTCFullYear(),Q.getUTCMonth());Q.setUTCDate(K);Q.setUTCDate(K-(Q.getUTCDay()-this.o.weekStart+7)%7);var r=new Date(Q);r.setUTCDate(r.getUTCDate()+42);r=r.valueOf();var B=[];var F;while(Q.valueOf()<r){if(Q.getUTCDay()===this.o.weekStart){B.push("<tr>");if(this.o.calendarWeeks){var s=new Date(+Q+(this.o.weekStart-Q.getUTCDay()-7)%7*86400000),w=new Date(Number(s)+(7+4-s.getUTCDay())%7*86400000),u=new Date(Number(u=m(w.getUTCFullYear(),0,1))+(7+4-u.getUTCDay())%7*86400000),D=(w-u)/86400000/7+1;B.push('<td class="cw">'+D+"</td>")}}F=this.getClassNames(Q);F.push("day");if(this.o.beforeShowDay!==i.noop){var E=this.o.beforeShowDay(this._utc_to_local(Q));if(E===e){E={}}else{if(typeof(E)==="boolean"){E={enabled:E}}else{if(typeof(E)==="string"){E={classes:E}}}}if(E.enabled===false){F.push("disabled")}if(E.classes){F=F.concat(E.classes.split(/\s+/))}if(E.tooltip){v=E.tooltip}}F=i.unique(F);B.push('<td class="'+F.join(" ")+'"'+(v?' title="'+v+'"':"")+">"+Q.getUTCDate()+"</td>");v=null;if(Q.getUTCDay()===this.o.weekEnd){B.push("</tr>")}Q.setUTCDate(Q.getUTCDate()+1)}this.picker.find(".datepicker-days tbody").empty().append(B.join(""));var y=this.picker.find(".datepicker-months").find("th:eq(1)").text(C).end().find("span").removeClass("active");i.each(this.dates,function(R,S){if(S.getUTCFullYear()===C){y.eq(S.getUTCMonth()).addClass("active")}});if(C<H||C>z){y.addClass("disabled")}if(C===H){y.slice(0,L).addClass("disabled")}if(C===z){y.slice(I+1).addClass("disabled")}if(this.o.beforeShowMonth!==i.noop){var x=this;i.each(y,function(R,T){if(!i(T).hasClass("disabled")){var U=new Date(C,R,1);var S=x.o.beforeShowMonth(U);if(S===false){i(T).addClass("disabled")}}})}B="";C=parseInt(C/10,10)*10;var P=this.picker.find(".datepicker-years").find("th:eq(1)").text(C+"-"+(C+9)).end().find("td");C-=1;var G=i.map(this.dates,function(R){return R.getUTCFullYear()}),M;for(var J=-1;J<11;J++){M=["year"];if(J===-1){M.push("old")}else{if(J===10){M.push("new")}}if(i.inArray(C,G)!==-1){M.push("active")}if(C<H||C>z){M.push("disabled")}B+='<span class="'+M.join(" ")+'">'+C+"</span>";C+=1}P.html(B)},updateNavArrows:function(){if(!this._allow_update){return}var t=new Date(this.viewDate),r=t.getUTCFullYear(),s=t.getUTCMonth();switch(this.viewMode){case 0:if(this.o.startDate!==-Infinity&&r<=this.o.startDate.getUTCFullYear()&&s<=this.o.startDate.getUTCMonth()){this.picker.find(".prev").css({visibility:"hidden"})}else{this.picker.find(".prev").css({visibility:"visible"})}if(this.o.endDate!==Infinity&&r>=this.o.endDate.getUTCFullYear()&&s>=this.o.endDate.getUTCMonth()){this.picker.find(".next").css({visibility:"hidden"})}else{this.picker.find(".next").css({visibility:"visible"})}break;case 1:case 2:if(this.o.startDate!==-Infinity&&r<=this.o.startDate.getUTCFullYear()){this.picker.find(".prev").css({visibility:"hidden"})}else{this.picker.find(".prev").css({visibility:"visible"})}if(this.o.endDate!==Infinity&&r>=this.o.endDate.getUTCFullYear()){this.picker.find(".next").css({visibility:"hidden"})}else{this.picker.find(".next").css({visibility:"visible"})}break}},click:function(x){x.preventDefault();var w=i(x.target).closest("span, td, th"),u,v,r;if(w.length===1){switch(w[0].nodeName.toLowerCase()){case"th":switch(w[0].className){case"datepicker-switch":this.showMode(1);break;case"prev":case"next":var t=l.modes[this.viewMode].navStep*(w[0].className==="prev"?-1:1);switch(this.viewMode){case 0:this.viewDate=this.moveMonth(this.viewDate,t);this._trigger("changeMonth",this.viewDate);break;case 1:case 2:this.viewDate=this.moveYear(this.viewDate,t);if(this.viewMode===1){this._trigger("changeYear",this.viewDate)}break}this.fill();break;case"today":var s=new Date();s=m(s.getFullYear(),s.getMonth(),s.getDate(),0,0,0);this.showMode(-2);var y=this.o.todayBtn==="linked"?null:"view";this._setDate(s,y);break;case"clear":this.clearDates();break}break;case"span":if(!w.hasClass("disabled")){this.viewDate.setUTCDate(1);if(w.hasClass("month")){r=1;v=w.parent().find("span").index(w);u=this.viewDate.getUTCFullYear();this.viewDate.setUTCMonth(v);this._trigger("changeMonth",this.viewDate);if(this.o.minViewMode===1){this._setDate(m(u,v,r))}}else{r=1;v=0;u=parseInt(w.text(),10)||0;this.viewDate.setUTCFullYear(u);this._trigger("changeYear",this.viewDate);if(this.o.minViewMode===2){this._setDate(m(u,v,r))}}this.showMode(-1);this.fill()}break;case"td":if(w.hasClass("day")&&!w.hasClass("disabled")){r=parseInt(w.text(),10)||1;u=this.viewDate.getUTCFullYear();v=this.viewDate.getUTCMonth();if(w.hasClass("old")){if(v===0){v=11;u-=1}else{v-=1}}else{if(w.hasClass("new")){if(v===11){v=0;u+=1}else{v+=1}}}this._setDate(m(u,v,r))}break}}if(this.picker.is(":visible")&&this._focused_from){i(this._focused_from).focus()}delete this._focused_from},_toggle_multidate:function(s){var r=this.dates.contains(s);if(!s){this.dates.clear()}if(r!==-1){if(this.o.multidate===true||this.o.multidate>1||this.o.toggleActive){this.dates.remove(r)}}else{if(this.o.multidate===false){this.dates.clear();this.dates.push(s)}else{this.dates.push(s)}}if(typeof this.o.multidate==="number"){while(this.dates.length>this.o.multidate){this.dates.remove(0)}}},_setDate:function(r,t){if(!t||t==="date"){this._toggle_multidate(r&&new Date(r))}if(!t||t==="view"){this.viewDate=r&&new Date(r)}this.fill();this.setValue();if(!t||t!=="view"){this._trigger("changeDate")}var s;if(this.isInput){s=this.element}else{if(this.component){s=this.element.find("input")}}if(s){s.change()}if(this.o.autoclose&&(!t||t==="date")){this.hide()}},moveMonth:function(r,s){if(!r){return e}if(!s){return r}var v=new Date(r.valueOf()),z=v.getUTCDate(),w=v.getUTCMonth(),u=Math.abs(s),y,x;s=s>0?1:-1;if(u===1){x=s===-1?function(){return v.getUTCMonth()===w}:function(){return v.getUTCMonth()!==y};y=w+s;v.setUTCMonth(y);if(y<0||y>11){y=(y+12)%12}}else{for(var t=0;t<u;t++){v=this.moveMonth(v,s)}y=v.getUTCMonth();v.setUTCDate(z);x=function(){return y!==v.getUTCMonth()}}while(x()){v.setUTCDate(--z);v.setUTCMonth(y)}return v},moveYear:function(s,r){return this.moveMonth(s,r*12)},dateWithinRange:function(r){return r>=this.o.startDate&&r<=this.o.endDate},keydown:function(x){if(!this.picker.is(":visible")){if(x.keyCode===27){this.show()}return}var t=false,s,r,v,w=this.focusDate||this.viewDate;switch(x.keyCode){case 27:if(this.focusDate){this.focusDate=null;this.viewDate=this.dates.get(-1)||this.viewDate;this.fill()}else{this.hide()}x.preventDefault();break;case 37:case 39:if(!this.o.keyboardNavigation){break}s=x.keyCode===37?-1:1;if(x.ctrlKey){r=this.moveYear(this.dates.get(-1)||f(),s);v=this.moveYear(w,s);this._trigger("changeYear",this.viewDate)}else{if(x.shiftKey){r=this.moveMonth(this.dates.get(-1)||f(),s);v=this.moveMonth(w,s);this._trigger("changeMonth",this.viewDate)}else{r=new Date(this.dates.get(-1)||f());r.setUTCDate(r.getUTCDate()+s);v=new Date(w);v.setUTCDate(w.getUTCDate()+s)}}if(this.dateWithinRange(v)){this.focusDate=this.viewDate=v;this.setValue();this.fill();x.preventDefault()}break;case 38:case 40:if(!this.o.keyboardNavigation){break}s=x.keyCode===38?-1:1;if(x.ctrlKey){r=this.moveYear(this.dates.get(-1)||f(),s);v=this.moveYear(w,s);this._trigger("changeYear",this.viewDate)}else{if(x.shiftKey){r=this.moveMonth(this.dates.get(-1)||f(),s);v=this.moveMonth(w,s);this._trigger("changeMonth",this.viewDate)}else{r=new Date(this.dates.get(-1)||f());r.setUTCDate(r.getUTCDate()+s*7);v=new Date(w);v.setUTCDate(w.getUTCDate()+s*7)}}if(this.dateWithinRange(v)){this.focusDate=this.viewDate=v;this.setValue();this.fill();x.preventDefault()}break;case 32:break;case 13:w=this.focusDate||this.dates.get(-1)||this.viewDate;if(this.o.keyboardNavigation){this._toggle_multidate(w);t=true}this.focusDate=null;this.viewDate=this.dates.get(-1)||this.viewDate;this.setValue();this.fill();if(this.picker.is(":visible")){x.preventDefault();if(typeof x.stopPropagation==="function"){x.stopPropagation()}else{x.cancelBubble=true}if(this.o.autoclose){this.hide()}}break;case 9:this.focusDate=null;this.viewDate=this.dates.get(-1)||this.viewDate;this.fill();this.hide();break}if(t){if(this.dates.length){this._trigger("changeDate")}else{this._trigger("clearDate")}var u;if(this.isInput){u=this.element}else{if(this.component){u=this.element.find("input")}}if(u){u.change()}}},showMode:function(r){if(r){this.viewMode=Math.max(this.o.minViewMode,Math.min(2,this.viewMode+r))}this.picker.children("div").hide().filter(".datepicker-"+l.modes[this.viewMode].clsName).css("display","block");this.updateNavArrows()}};var p=function(s,r){this.element=i(s);this.inputs=i.map(r.inputs,function(t){return t.jquery?t[0]:t});delete r.inputs;n.call(i(this.inputs),r).bind("changeDate",i.proxy(this.dateUpdated,this));this.pickers=i.map(this.inputs,function(t){return i(t).data("datepicker")});this.updateDates()};p.prototype={updateDates:function(){this.dates=i.map(this.pickers,function(r){return r.getUTCDate()});this.updateRanges()},updateRanges:function(){var r=i.map(this.dates,function(s){return s.valueOf()});i.each(this.pickers,function(s,t){t.setRange(r)})},dateUpdated:function(w){if(this.updating){return}this.updating=true;var x=i(w.target).data("datepicker"),v=x.getUTCDate(),u=i.inArray(w.target,this.inputs),t=u-1,s=u+1,r=this.inputs.length;if(u===-1){return}i.each(this.pickers,function(y,z){if(!z.getUTCDate()){z.setUTCDate(v)}});if(v<this.dates[t]){while(t>=0&&v<this.dates[t]){this.pickers[t--].setUTCDate(v)}}else{if(v>this.dates[s]){while(s<r&&v>this.dates[s]){this.pickers[s++].setUTCDate(v)}}}this.updateDates();delete this.updating},remove:function(){i.map(this.pickers,function(r){r.remove()});delete this.element.data().datepicker}};function h(u,x){var w=i(u).data(),r={},v,t=new RegExp("^"+x.toLowerCase()+"([A-Z])");x=new RegExp("^"+x.toLowerCase());function y(A,z){return z.toLowerCase()}for(var s in w){if(x.test(s)){v=s.replace(t,y);r[v]=w[s]}}return r}function a(t){var r={};if(!b[t]){t=t.split("-")[0];if(!b[t]){return}}var s=b[t];i.each(o,function(v,u){if(u in s){r[u]=s[u]}});return r}var c=i.fn.datepicker;var n=function(t){var r=Array.apply(null,arguments);r.shift();var s;this.each(function(){var B=i(this),z=B.data("datepicker"),v=typeof t==="object"&&t;if(!z){var x=h(this,"date"),u=i.extend({},g,x,v),w=a(u.language),y=i.extend({},g,w,x,v);if(B.hasClass("input-daterange")||y.inputs){var A={inputs:y.inputs||B.find("input").toArray()};B.data("datepicker",(z=new p(this,i.extend(y,A))))}else{B.data("datepicker",(z=new j(this,y)))}}if(typeof t==="string"&&typeof z[t]==="function"){s=z[t].apply(z,r);if(s!==e){return false}}});if(s!==e){return s}else{return this}};i.fn.datepicker=n;var g=i.fn.datepicker.defaults={autoclose:false,beforeShowDay:i.noop,beforeShowMonth:i.noop,calendarWeeks:false,clearBtn:false,toggleActive:false,daysOfWeekDisabled:[],datesDisabled:[],endDate:Infinity,forceParse:true,format:"mm/dd/yyyy",keyboardNavigation:true,language:"en",minViewMode:0,multidate:false,multidateSeparator:",",orientation:"auto",rtl:false,startDate:-Infinity,startView:0,todayBtn:false,todayHighlight:false,weekStart:0,disableTouchKeyboard:false,enableOnReadonly:true,container:"body"};var o=i.fn.datepicker.locale_opts=["format","rtl","weekStart"];i.fn.datepicker.Constructor=j;var b=i.fn.datepicker.dates={en:{days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"],daysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat","Sun"],daysMin:["Su","Mo","Tu","We","Th","Fr","Sa","Su"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],today:"Today",clear:"Clear"}};var l={modes:[{clsName:"days",navFnc:"Month",navStep:1},{clsName:"months",navFnc:"FullYear",navStep:1},{clsName:"years",navFnc:"FullYear",navStep:10}],isLeapYear:function(r){return(((r%4===0)&&(r%100!==0))||(r%400===0))},getDaysInMonth:function(r,s){return[31,(l.isLeapYear(r)?29:28),31,30,31,30,31,31,30,31,30,31][s]},validParts:/dd?|DD?|mm?|MM?|yy(?:yy)?/g,nonpunctuation:/[^ -\/:-@\[\u3400-\u9fff-`{-~\t\n\r]+/g,parseFormat:function(t){var r=t.replace(this.validParts,"\0").split("\0"),s=t.match(this.validParts);if(!r||!r.length||!s||s.length===0){throw new Error("Invalid date format.")}return{separators:r,parts:s}},parseDate:function(I,F,C){if(!I){return e}if(I instanceof Date){return I}if(typeof F==="string"){F=l.parseFormat(F)}var u=/([\-+]\d+)([dmwy])/,A=I.match(/([\-+]\d+)([dmwy])/g),B,z,E;if(/^[\-+]\d+[dmwy]([\s,]+[\-+]\d+[dmwy])*$/.test(I)){I=new Date();for(E=0;E<A.length;E++){B=u.exec(A[E]);z=parseInt(B[1]);switch(B[2]){case"d":I.setUTCDate(I.getUTCDate()+z);break;case"m":I=j.prototype.moveMonth.call(j.prototype,I,z);break;case"w":I.setUTCDate(I.getUTCDate()+z*7);break;case"y":I=j.prototype.moveYear.call(j.prototype,I,z);break}}return m(I.getUTCFullYear(),I.getUTCMonth(),I.getUTCDate(),0,0,0)}A=I&&I.match(this.nonpunctuation)||[];I=new Date();var v={},G=["yyyy","yy","M","MM","m","mm","d","dd"],y={yyyy:function(K,s){return K.setUTCFullYear(s)},yy:function(K,s){return K.setUTCFullYear(2000+s)},m:function(K,s){if(isNaN(K)){return K}s-=1;while(s<0){s+=12}s%=12;K.setUTCMonth(s);while(K.getUTCMonth()!==s){K.setUTCDate(K.getUTCDate()-1)}return K},d:function(K,s){return K.setUTCDate(s)}},J,t;y.M=y.MM=y.mm=y.m;y.dd=y.d;I=m(I.getFullYear(),I.getMonth(),I.getDate(),0,0,0);var r=F.parts.slice();if(A.length!==r.length){r=i(r).filter(function(s,K){return i.inArray(K,G)!==-1}).toArray()}function H(){var s=this.slice(0,A[E].length),K=A[E].slice(0,s.length);return s.toLowerCase()===K.toLowerCase()}if(A.length===r.length){var D;for(E=0,D=r.length;E<D;E++){J=parseInt(A[E],10);B=r[E];if(isNaN(J)){switch(B){case"MM":t=i(b[C].months).filter(H);J=i.inArray(t[0],b[C].months)+1;break;case"M":t=i(b[C].monthsShort).filter(H);J=i.inArray(t[0],b[C].monthsShort)+1;break}}v[B]=J}var w,x;for(E=0;E<G.length;E++){x=G[E];if(x in v&&!isNaN(v[x])){w=new Date(I);y[x](w,v[x]);if(!isNaN(w)){I=w}}}}return I},formatDate:function(r,v,x){if(!r){return""}if(typeof v==="string"){v=l.parseFormat(v)}var w={d:r.getUTCDate(),D:b[x].daysShort[r.getUTCDay()],DD:b[x].days[r.getUTCDay()],m:r.getUTCMonth()+1,M:b[x].monthsShort[r.getUTCMonth()],MM:b[x].months[r.getUTCMonth()],yy:r.getUTCFullYear().toString().substring(2),yyyy:r.getUTCFullYear()};w.dd=(w.d<10?"0":"")+w.d;w.mm=(w.m<10?"0":"")+w.m;r=[];var u=i.extend([],v.separators);for(var t=0,s=v.parts.length;t<=s;t++){if(u.length){r.push(u.shift())}r.push(w[v.parts[t]])}return r.join("")},headTemplate:'<thead><tr><th class="prev">&#171;</th><th colspan="5" class="datepicker-switch"></th><th class="next">&#187;</th></tr></thead>',contTemplate:'<tbody><tr><td colspan="7"></td></tr></tbody>',footTemplate:'<tfoot><tr><th colspan="7" class="today"></th></tr><tr><th colspan="7" class="clear"></th></tr></tfoot>'};l.template='<div class="datepicker"><div class="datepicker-days"><table class=" table-condensed">'+l.headTemplate+"<tbody></tbody>"+l.footTemplate+'</table></div><div class="datepicker-months"><table class="table-condensed">'+l.headTemplate+l.contTemplate+l.footTemplate+'</table></div><div class="datepicker-years"><table class="table-condensed">'+l.headTemplate+l.contTemplate+l.footTemplate+"</table></div></div>";i.fn.datepicker.DPGlobal=l;i.fn.datepicker.noConflict=function(){i.fn.datepicker=c;return this};i.fn.datepicker.version="1.4.0";i(document).on("focus.datepicker.data-api click.datepicker.data-api",'[data-provide="datepicker"]',function(s){var r=i(this);if(r.data("datepicker")){return}s.preventDefault();n.call(r,"show")});i(function(){n.call(i('[data-provide="datepicker-inline"]'))})}(window.jQuery));