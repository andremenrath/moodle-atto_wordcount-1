YUI.add("moodle-atto_wordcount-button",function(d,t){var r=0;d.namespace("M.atto_wordcount").Button=d.Base.create("button",d.M.editor_atto.EditorPlugin,[],{block:0,updateRate:200,counterid:null,spacer:/(<\/(?!a>|b>|del>|em>|i>|ins>|s>|small>|strong>|sub>|sup>|u>)\w+>|<br> | <br\s*\/>)/g,mediaTags:/(<(audio|video)).*(<\/(audio|video)>)/gm,counter:new RegExp("[\\p{Z}\\p{Cc}—–]+","gu"),initializer:function(){var t,e,i,n=this.get("host"),o=n._wrapper;this.counterid=n.get("elementid")+"-word-count",this.counterid=this.counterid.replace(":","-"),this.counterElement=d.Node.create('<span class="badge badge-light" id="'+this.counterid+'">0</span>'),o.appendChild(d.Node.create('<div class="'+this.toolbar.getAttribute("class")+' editor_atto_toolbar_bottom p-0 d-flex"><div class="d-inline-flex p-1"><strong>'+M.util.get_string("words","atto_wordcount")+': </strong><span id="'+this.counterid+'">0</span></div></div>')),this.wordlimit=this.get("wordlimits")[r],this.wordlimit&&(window.console.log("here"),(t=document.createElement("i")).classList.add("icon","fa","fa-exclamation","fa-fw"),t.id=this.counterid+"-warning-icon",document.getElementById(this.counterid).parentNode.insertBefore(t,document.getElementById(this.counterid)),(e=document.createElement("span")).innerHTML="/",document.getElementById(this.counterid).parentNode.appendChild(e),(i=document.createElement("span")).innerHTML=this.wordlimit,document.getElementById(this.counterid).parentNode.appendChild(i)),r+=1,this._count(n.get("editor")),this.get("host").on("pluginsloaded",function(){this.get("host").on("atto:selectionchanged",this._count,this)},this)},_count:function(e){var i=this;i.block||(i.block=1,setTimeout(function(){var t=i._getCount(e);d.one("#"+i.counterid).set("text",t),i.wordlimit&&(i.wordlimit-t<0?d.one("#"+i.counterid+"-warning-icon").setStyle("display","inline"):d.one("#"+i.counterid+"-warning-icon").setStyle("display","none")),setTimeout(function(){i.block=0},i.updateRate)}))},_getCount:function(){var t,e=0,i=this.get("host").getCleanHTML();return i&&(t=(t=(i=(i=(i=i.replace(this.spacer,"$1 ")).replace(/<.[^<>]*?>/g,"")).replace(/&nbsp;|&#160;/gi," ")).split(this.counter,-1)).filter(function(t){return""!=t.trim()}))&&(e=t.length),e}},{ATTRS:{wordlimits:{value:[0]}}})},"@VERSION@",{requires:["moodle-editor_atto-plugin"]});