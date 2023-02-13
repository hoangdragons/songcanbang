(function(a){if(typeof define==="function"&&define.amd){define(["jquery"],a)}else{if(typeof exports==="object"){module.exports=a(require("jquery"))}else{a(jQuery)}}}(function(c){var b="tinycolorpicker",d={colors:["#ffffff","#A7194B","#FE2712","#FB9902","#FABC02","#FEFE33","#D0EA2B","#66B032","#0391CE","#0247FE","#3D01A5","#8601AF"],backgroundUrl:null};function a(s,u){this.options=c.extend({},d,u);this._defaults=d;this._name=b;var t=this,g=s.find(".track"),i=s.find(".color"),q=null,n=s.find(".colorInput"),o=s.find(".dropdown"),e=o.find("li").remove(),f=null,k=false,h=!!document.createElement("canvas").getContext,m="ontouchstart" in document.documentElement;this.colorHex="";this.colorRGB="";function j(){if(h){q=c("<canvas></canvas>");g.append(q);f=q[0].getContext("2d");r()}else{c.each(t.options.colors,function(w,v){var x=e.clone();x.css("backgroundColor",v);x.attr("data-color",v);o.append(x)})}p();return t}function r(){var v=new Image(),w=g.css("background-image").replace(/"/g,"").replace(/url\(|\)$/ig,"");g.css("background-image","none");c(v).load(function(){q.attr("width",this.width);q.attr("height",this.height);f.drawImage(v,0,0,this.width,this.height)});v.src=t.options.backgroundUrl||w}function p(){var v=m?"touchstart":"mousedown";if(h){i.bind(v,function(w){w.preventDefault();w.stopPropagation();g.toggle();c(document).bind("mousedown.colorpicker",function(x){c(document).unbind(".colorpicker");g.hide()})});if(!m){q.mousedown(function(w){k=true;l(w);c(document).bind("mouseup.colorpicker",function(x){k=false;c(document).unbind(".colorpicker");g.hide();return false});return false});q.mousemove(l)}else{q.bind("touchstart",function(w){k=true;l(w.originalEvent.touches[0]);return false});q.bind("touchmove",function(w){l(w.originalEvent.touches[0]);return false});q.bind("touchend",function(w){k=false;g.hide();return false})}}else{i.bind("mousedown",function(w){w.preventDefault();w.stopPropagation();o.toggle()});o.delegate("li","mousedown",function(x){x.preventDefault();x.stopImmediatePropagation();var w=c(this).attr("data-color");t.setColor(w);o.hide()})}}function l(x){if(k){var v=c(x.target),y=v.offset(),w=f.getImageData(x.pageX-y.left,x.pageY-y.top,1,1).data;t.setColor("rgb("+w[0]+","+w[1]+","+w[2]+")");s.trigger("change",[t.colorHex,t.colorRGB])}}this.setColor=function(v){if(v.indexOf("#")>=0){t.colorHex=v;t.colorRGB=t.hexToRgb(t.colorHex)}else{t.colorRGB=v;t.colorHex=t.rgbToHex(t.colorRGB)}i.find(".colorInner").css("backgroundColor",t.colorHex);n.val(t.colorHex)};this.hexToRgb=function(w){var v=/^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(w);return"rgb("+parseInt(v[1],16)+","+parseInt(v[2],16)+","+parseInt(v[3],16)+")"};this.rgbToHex=function(w){var v=w.match(/\d+/g);function x(y){var z=new Array("0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F");return isNaN(y)?"00":z[(y-y%16)/16]+z[y%16]}return"#"+x(v[0])+x(v[1])+x(v[2])};return j()}c.fn[b]=function(e){return this.each(function(){if(!c.data(this,"plugin_"+b)){c.data(this,"plugin_"+b,new a(c(this),e))}})}}));