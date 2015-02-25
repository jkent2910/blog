tinymce.PluginManager.add("noneditable",function(a){function b(a){var b;if(1===a.nodeType){if(b=a.getAttribute(k),b&&"inherit"!==b)return b;if(b=a.contentEditable,"inherit"!==b)return b}return null}function c(a){for(var c;a;){if(c=b(a))return"false"===c?a:null;a=a.parentNode}}function d(){function d(a){for(;a;){if(a.id===n)return a;a=a.parentNode}}function e(a){var b;if(a)for(b=new i(a,a),a=b.current();a;a=b.next())if(3===a.nodeType)return a}function f(c,d){var e,f;return"false"===b(c)&&k.isBlock(c)?void m.select(c):(f=k.createRng(),"true"===b(c)&&(c.firstChild||c.appendChild(a.getDoc().createTextNode("\xa0")),c=c.firstChild,d=!0),e=k.create("span",{id:n,"data-mce-bogus":!0},o),d?c.parentNode.insertBefore(e,c):k.insertAfter(e,c),f.setStart(e.firstChild,1),f.collapse(!0),m.setRng(f),e)}function g(a){var b,c,f,g;if(a)b=m.getRng(!0),b.setStartBefore(a),b.setEndBefore(a),c=e(a),c&&c.nodeValue.charAt(0)==o&&(c=c.deleteData(0,1)),k.remove(a,!0),m.setRng(b);else for(f=d(m.getStart());(a=k.get(n))&&a!==g;)f!==a&&(c=e(a),c&&c.nodeValue.charAt(0)==o&&(c=c.deleteData(0,1)),k.remove(a,!0)),g=a}function h(){function a(a,c){var d,e,f,g,h;if(d=j.startContainer,e=j.startOffset,3==d.nodeType){if(h=d.nodeValue.length,e>0&&h>e||(c?e==h:0===e))return}else{if(!(e<d.childNodes.length))return c?null:a;var k=!c&&e>0?e-1:e;d=d.childNodes[k],d.hasChildNodes()&&(d=d.firstChild)}for(f=new i(d,a);g=f[c?"prev":"next"]();){if(3===g.nodeType&&g.nodeValue.length>0)return;if("true"===b(g))return g}return a}var d,e,h,j,k;g(),h=m.isCollapsed(),d=c(m.getStart()),e=c(m.getEnd()),(d||e)&&(j=m.getRng(!0),h?(d=d||e,(k=a(d,!0))?f(k,!0):(k=a(d,!1))?f(k,!1):m.select(d)):(j=m.getRng(!0),d&&j.setStartBefore(d),e&&j.setEndAfter(e),m.setRng(j)))}function j(e){function f(a,b){for(;a=a[b?"previousSibling":"nextSibling"];)if(3!==a.nodeType||a.nodeValue.length>0)return a}function j(a,b){m.select(a),m.collapse(b)}function n(e){function f(a){for(var b=j;b;){if(b===a)return;b=b.parentNode}k.remove(a),h()}function g(){var d,g,h=a.schema.getNonEmptyElements();for(g=new tinymce.dom.TreeWalker(j,a.getBody());(d=e?g.prev():g.next())&&!h[d.nodeName.toLowerCase()]&&!(3===d.nodeType&&tinymce.trim(d.nodeValue).length>0);)if("false"===b(d))return f(d),!0;return c(d)?!0:!1}var i,j,l,n;if(m.isCollapsed()){if(i=m.getRng(!0),j=i.startContainer,l=i.startOffset,j=d(j)||j,n=c(j))return f(n),!1;if(3==j.nodeType&&(e?l>0:l<j.nodeValue.length))return!0;if(1==j.nodeType&&(j=j.childNodes[l]||j),g())return!1}return!0}var o,p,q,r,s=e.keyCode;if(q=m.getStart(),r=m.getEnd(),o=c(q)||c(r),o&&(112>s||s>124)&&s!=l.DELETE&&s!=l.BACKSPACE){if((tinymce.isMac?e.metaKey:e.ctrlKey)&&(67==s||88==s||86==s))return;if(e.preventDefault(),s==l.LEFT||s==l.RIGHT){var t=s==l.LEFT;if(a.dom.isBlock(o)){var u=t?o.previousSibling:o.nextSibling,v=new i(u,u),w=t?v.prev():v.next();j(w,!t)}else j(o,t)}}else if(s==l.LEFT||s==l.RIGHT||s==l.BACKSPACE||s==l.DELETE){if(p=d(q)){if(s==l.LEFT||s==l.BACKSPACE)if(o=f(p,!0),o&&"false"===b(o)){if(e.preventDefault(),s!=l.LEFT)return void k.remove(o);j(o,!0)}else g(p);if(s==l.RIGHT||s==l.DELETE)if(o=f(p),o&&"false"===b(o)){if(e.preventDefault(),s!=l.RIGHT)return void k.remove(o);j(o,!1)}else g(p)}if((s==l.BACKSPACE||s==l.DELETE)&&!n(s==l.BACKSPACE))return e.preventDefault(),!1}}var k=a.dom,m=a.selection,n="mce_noneditablecaret",o="\ufeff";a.on("mousedown",function(c){var d=a.selection.getNode();"false"===b(d)&&d==c.target&&h()}),a.on("mouseup keyup",h),a.on("keydown",j)}function e(b){var c=h.length,d=b.content,e=tinymce.trim(g);if("raw"!=b.format){for(;c--;)d=d.replace(h[c],function(b){var c=arguments,f=c[c.length-2];return f>0&&'"'==d.charAt(f-1)?b:'<span class="'+e+'" data-mce-content="'+a.dom.encode(c[0])+'">'+a.dom.encode("string"==typeof c[1]?c[1]:c[0])+"</span>"});b.content=d}}var f,g,h,i=tinymce.dom.TreeWalker,j="contenteditable",k="data-mce-"+j,l=tinymce.util.VK;f=" "+tinymce.trim(a.getParam("noneditable_editable_class","mceEditable"))+" ",g=" "+tinymce.trim(a.getParam("noneditable_noneditable_class","mceNonEditable"))+" ",h=a.getParam("noneditable_regexp"),h&&!h.length&&(h=[h]),a.on("PreInit",function(){d(),h&&a.on("BeforeSetContent",e),a.parser.addAttributeFilter("class",function(a){for(var b,c,d=a.length;d--;)c=a[d],b=" "+c.attr("class")+" ",-1!==b.indexOf(f)?c.attr(k,"true"):-1!==b.indexOf(g)&&c.attr(k,"false")}),a.serializer.addAttributeFilter(k,function(a){for(var b,c=a.length;c--;)b=a[c],h&&b.attr("data-mce-content")?(b.name="#text",b.type=3,b.raw=!0,b.value=b.attr("data-mce-content")):(b.attr(j,null),b.attr(k,null))}),a.parser.addAttributeFilter(j,function(a){for(var b,c=a.length;c--;)b=a[c],b.attr(k,b.attr(j)),b.attr(j,null)})}),a.on("drop",function(a){c(a.target)&&a.preventDefault()})});