(function(window){var svgSprite='<svg><symbol id="icon-user" viewBox="0 0 1024 1024"><path d="M535.272727 69.818182c-257.070545 0-465.454545 208.384-465.454545 465.454545 0 257.070545 208.384 465.454545 465.454545 465.454545 257.070545 0 465.454545-208.384 465.454545-465.454545C1000.727273 278.202182 792.343273 69.818182 535.272727 69.818182zM254.184727 845.265455C298.030545 732.253091 406.760727 651.636364 535.272727 651.636364c128.512 0 237.242182 80.616727 281.088 193.582545-74.379636 67.490909-172.776727 108.962909-281.088 108.962909C426.961455 954.181818 328.564364 912.709818 254.184727 845.265455zM395.636364 465.454545c0-77.125818 62.510545-139.636364 139.636364-139.636364 77.125818 0 139.636364 62.510545 139.636364 139.636364s-62.510545 139.636364-139.636364 139.636364C458.146909 605.090909 395.636364 542.580364 395.636364 465.454545zM851.502545 809.472c-41.146182-89.786182-118.365091-159.278545-213.876364-188.695273C688.081455 587.496727 721.454545 530.432 721.454545 465.454545c0-102.818909-83.362909-186.181818-186.181818-186.181818-102.818909 0-186.181818 83.362909-186.181818 186.181818 0 64.977455 33.373091 122.042182 83.874909 155.368727-95.511273 29.370182-172.730182 98.862545-213.876364 188.695273C155.229091 735.976727 116.363636 640.279273 116.363636 535.272727c0-231.377455 187.531636-418.909091 418.909091-418.909091 231.377455 0 418.909091 187.531636 418.909091 418.909091C954.181818 640.279273 915.269818 735.976727 851.502545 809.472z"  ></path></symbol><symbol id="icon-logout" viewBox="0 0 1024 1024"><path d="M184.552727 768l0-512c0-38.539636 31.278545-69.818182 69.818182-69.818182l302.545455 0L556.916364 139.636364l-325.818182 0c-51.432727 0-93.090909 41.658182-93.090909 93.090909l0 558.545455c0 51.432727 41.658182 93.090909 93.090909 93.090909l325.818182 0 0-46.545455-302.545455 0C215.784727 837.818182 184.552727 806.539636 184.552727 768zM924.113455 495.522909l-164.584727-164.584727c-9.076364-9.076364-23.831273-9.076364-32.907636 0-9.076364 9.076364-9.076364 23.831273 0 32.907636l124.834909 124.834909L394.007273 488.680727c-12.846545 0-23.272727 10.426182-23.272727 23.272727s10.426182 23.272727 23.272727 23.272727l457.448727 0-124.834909 124.834909c-9.076364 9.076364-9.076364 23.831273 0 32.907636 9.076364 9.076364 23.831273 9.076364 32.907636 0l164.584727-164.584727C933.189818 519.354182 933.189818 504.645818 924.113455 495.522909z"  ></path></symbol><symbol id="icon-xiangyou" viewBox="0 0 1024 1024"><path d="M316.017 903.889c8.805 0 17.65-2.828 25.14-8.685l356.91-279.696c32.232-25.261 50.759-63.271 50.759-104.268 0-41.038-18.527-79.047-50.799-104.308l-354.877-278.141c-17.811-13.905-43.388-10.758-57.294 6.933-13.905 17.729-10.797 43.388 6.933 57.294l354.917 278.141c12.43 9.722 19.523 24.305 19.523 40.082 0 15.738-7.092 30.321-19.483 40.043l-356.95 279.696c-17.729 13.905-20.838 39.523-6.933 57.294 8.049 10.239 20.041 15.618 32.153 15.618z"  ></path></symbol><symbol id="icon-xiangzuo" viewBox="0 0 1024 1024"><path d="M707.982 903.889c-8.805 0-17.65-2.828-25.14-8.685l-356.91-279.696c-32.232-25.261-50.759-63.271-50.759-104.268 0-41.038 18.527-79.047 50.799-104.308l354.878-278.141c17.811-13.905 43.388-10.758 57.294 6.933 13.905 17.729 10.797 43.388-6.933 57.294l-354.917 278.141c-12.43 9.722-19.523 24.305-19.523 40.082 0 15.738 7.092 30.321 19.483 40.043l356.949 279.696c17.729 13.905 20.838 39.523 6.933 57.294-8.047 10.239-20.040 15.618-32.152 15.618z"  ></path></symbol></svg>';var script=function(){var scripts=document.getElementsByTagName("script");return scripts[scripts.length-1]}();var shouldInjectCss=script.getAttribute("data-injectcss");var ready=function(fn){if(document.addEventListener){if(~["complete","loaded","interactive"].indexOf(document.readyState)){setTimeout(fn,0)}else{var loadFn=function(){document.removeEventListener("DOMContentLoaded",loadFn,false);fn()};document.addEventListener("DOMContentLoaded",loadFn,false)}}else if(document.attachEvent){IEContentLoaded(window,fn)}function IEContentLoaded(w,fn){var d=w.document,done=false,init=function(){if(!done){done=true;fn()}};var polling=function(){try{d.documentElement.doScroll("left")}catch(e){setTimeout(polling,50);return}init()};polling();d.onreadystatechange=function(){if(d.readyState=="complete"){d.onreadystatechange=null;init()}}}};var before=function(el,target){target.parentNode.insertBefore(el,target)};var prepend=function(el,target){if(target.firstChild){before(el,target.firstChild)}else{target.appendChild(el)}};function appendSvg(){var div,svg;div=document.createElement("div");div.innerHTML=svgSprite;svgSprite=null;svg=div.getElementsByTagName("svg")[0];if(svg){svg.setAttribute("aria-hidden","true");svg.style.position="absolute";svg.style.width=0;svg.style.height=0;svg.style.overflow="hidden";prepend(svg,document.body)}}if(shouldInjectCss&&!window.__iconfont__svg__cssinject__){window.__iconfont__svg__cssinject__=true;try{document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>")}catch(e){console&&console.log(e)}}ready(appendSvg)})(window)