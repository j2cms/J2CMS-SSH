// JavaScript Document
window.google = {
	kEI : "HBnlR8bgAorksALn3dTbBw",
	kEXPI : "17259,17735,18065",
	kHL : "zh-CN"
};
function sf() {
	document.f.q.focus()
}
window.clk = function(b, c, d, e, f, g) {
	if (document.images) {
		var a = encodeURIComponent || escape;
		(new Image).src = "/url?sa=T"
				+ (c ? "&oi=" + a(c) : "")
				+ (d ? "&cad=" + a(d) : "")
				+ "&ct="
				+ a(e)
				+ "&cd="
				+ a(f)
				+ (b ? "&url=" + a(b.replace(/#.*/, "")).replace(/\+/g, "%2B")
						: "") + "&ei=HBnlR8bgAorksALn3dTbBw" + g
	}
	return true
};
window.gbar = {};
(function() {
	var b = window.gbar, c, g, h;
	function n(d, f, e) {
		d.visibility = h ? "hidden" : "visible";
		d.left = f + "px";
		d.top = e + "px"
	}
	b.tg = function(d) {
		var f = 0, e = 0, a, i = 0, o, l = window.navExtra, m, j = document, k = 0;
		g = g || j.getElementById("gbar").getElementsByTagName("span");
		(d || window.event).cancelBubble = !i;
		if (!c) {
			c = j.createElement(Array.every || window.createPopup ? "iframe"
					: "DIV");
			c.frameBorder = "0";
			c.scrolling = "no";
			c.src = "#";
			g[7].parentNode.appendChild(c).id = "gbi";
			if (l && g[7])
				for (o in l) {
					m = j.createElement("span");
					m.appendChild(l[o]);
					g[7].parentNode.insertBefore(m, g[7]).className = "gb2"
				}
			j.onclick = b.close
		}
		while (a = g[++i]) {
			if (e) {
				n(a.style, e + 1, f + 25);
				k = Math.max(k, a.firstChild.tagName == "A" && a.offsetWidth);
				f += a.firstChild.tagName == "DIV" ? 9 : 20
			}
			if (a.className == "gb3") {
				do
					e += a.offsetLeft;
				while (a = a.offsetParent)
			}
		}
		{
			i = 0;
			while (a = g[++i])
				if (a.className == "gb2")
					a.style.width = k + "px";
			c.style.width = k + "px"
		}
		c.style.height = f + "px";
		n(c.style, e, 24);
		h = !h
	};
	b.close = function(d) {
		h && b.tg(d)
	}
})();
(function() {
	function g(a, b, c) {
		var d = "on" + b;
		if (a.addEventListener) {
			a.addEventListener(b, c, false)
		} else if (a.attachEvent) {
			a.attachEvent(d, c)
		} else {
			var e = a[d];
			a[d] = function() {
				var f = e.apply(this, arguments), h = c.apply(this, arguments);
				return f == undefined ? h : (h == undefined ? f : h && f)
			}
		}
	}
	;
	var aa, i, j, l, n = "", o, p = null, q = null, r = null, s = -1, t, u, v, w, x = null, y = null, z, A, ba = {}, B = null, C, F = 0, G = 0, H = 0, I = null, J, K = false, L = false, M, N;
	{
		var ca = navigator.userAgent.toLowerCase();
		M = ca.indexOf("opera") != -1;
		N = ca.indexOf("msie") != -1 && !M
	}
	var O = null, da = new RegExp(
			"^[\\s\\u1100-\\u11FF\\u3040-\\u30FF\\u3130-\\u318F\\u31F0-\\u31FF\\u3400-\\u4DBF\\u4E00-\\u9FFF\\uAC00-\\uD7A3\\uF900-\\uFAFF\\uFF65-\\uFFDC]+$"), P = "google-ac-", ea = true;
	function fa(a, b, c, d, e, f, h, m) {
		t = a;
		u = b;
		aa = d;
		O = e;
		ea = f;
		if (ga() == null) {
			return
		}
		var k = window.google.kHL;
		J = /^(zh-(CN|TW)|ja|ko)$/.test(k);
		if (c == "search")
			c = "";
		C = "/complete/search?hl=" + k + (c ? "&ds=" + c : "")
				+ (m ? "&pq=" + ha(m) : "") + (h ? "&expid=" + h : "")
				+ "&client=suggest";
		t.onsubmit = ia;
		u.setAttribute("autocomplete", "off");
		g(u, "blur", ja);
		g(u, "beforedeactivate", ka);
		if (u.addEventListener) {
			u.onkeypress = la;
			u.onkeyup = na
		} else {
			g(u, N ? "keydown" : "keypress", la);
			g(u, "keyup", na)
		}
		j = (l = (i = u.value));
		o = oa(u);
		v = document.createElement("table");
		v.id = "completeTable";
		v.cellSpacing = (v.cellPadding = "0");
		w = v.style;
		v.className = P + "m";
		Q();
		document.body.appendChild(v);
		if (N) {
			x = document.createElement("iframe");
			y = x.style;
			x.id = "completeIFrame";
			y.zIndex = "1";
			y.position = "absolute";
			y.display = "block";
			y.borderWidth = 0;
			document.body.appendChild(x)
		}
		R();
		pa("", [], []);
		qa();
		g(window, "resize", R);
		g(window, "pageshow", ra);
		if (J)
			window.setInterval(sa, 10);
		z = ta("aq", "f", false);
		A = ta("oq", "", true);
		S()
	}
	function ra(a) {
		if (a.persisted)
			z.value = "f";
		A.value = ""
	}
	function qa() {
		var a = document.body.dir == "rtl", b = a ? "right" : "left", c = a ? "left"
				: "right", d = document.getElementsByTagName("head")[0], e = document
				.createElement("style"), f = null, h = null, m = false;
		if (document.styleSheets) {
			d.appendChild(e);
			m = true;
			f = e.sheet ? e.sheet : e.styleSheet
		}
		if (!f) {
			h = document.createTextNode("");
			e.appendChild(h)
		}
		var k = function(D, E) {
			var ma = D + " { " + E + " }";
			if (f) {
				if (f.insertRule) {
					f.insertRule(ma, f.cssRules.length)
				} else if (f.addRule) {
					f.addRule(D, E)
				}
			} else {
				h.data += ma + "\n"
			}
		};
		k(
				"." + P + "m",
				"font-size:13px;font-family:arial,sans-serif;cursor:default;line-height:17px;border:1px solid black;z-index:99;position:absolute;background-color:white;margin:0;");
		k("." + P + "a", "background-color:white;");
		k("." + P + "b", "background-color:#36c;color:white;");
		k("." + P + "c", "white-space:nowrap;overflow:hidden;text-align:" + b
				+ ";padding-" + b + ":3px;"
				+ (N || M ? "padding-bottom:1px;" : ""));
		k("." + P + "d",
				"white-space:nowrap;overflow:hidden;font-size:10px;text-align:"
						+ c + ";color:green;padding-" + b + ":3px;padding-" + c
						+ ":3px;");
		k("." + P + "b td", "color:white;");
		k("." + P + "e td", "padding:0 3px 2px;text-align:" + c
				+ ";font-size:10px;line-height:15px;");
		k("." + P + "e td",
				"color:blue;text-decoration:underline;cursor:pointer;");
		if (!m)
			d.appendChild(e)
	}
	function R() {
		if (v) {
			w.left = ua(u, "offsetLeft") + "px";
			w.top = ua(u, "offsetTop") + u.offsetHeight - 1 + "px";
			w.width = u.offsetWidth + "px";
			if (x) {
				y.left = w.left;
				y.top = w.top;
				y.width = w.width;
				y.height = v.offsetHeight + "px"
			}
		}
	}
	function T(a, b) {
		a.visibility = b ? "visible" : "hidden"
	}
	function ta(a, b, c) {
		var d = document.createElement("input");
		d.type = "hidden";
		d.name = a;
		d.value = b;
		d.disabled = c;
		t.appendChild(d);
		return d
	}
	function ja() {
		if (!K)
			Q();
		K = false
	}
	function ka() {
		if (K) {
			window.event.cancelBubble = true;
			window.event.returnValue = false
		}
		K = false
	}
	function la(a) {
		var b = a.keyCode;
		if (b == 27 && va()) {
			Q();
			U(j);
			a.cancelBubble = true;
			a.returnValue = false;
			return false
		}
		if (!V(b))
			return true;
		H++;
		if (H % 3 == 1)
			W(b);
		return false
	}
	function na(a) {
		var b = a.keyCode;
		if (!(J && V(b)) && H == 0)
			W(b);
		H = 0;
		return !V(b)
	}
	function W(a) {
		if (J && V(a))
			wa();
		if (u.value != i || a == 39) {
			j = u.value;
			o = oa(u);
			if (a != 39)
				A.value = j
		}
		if (xa(a)) {
			ya(s + 1)
		} else if (za(a)) {
			ya(s - 1)
		}
		R();
		if (n != j && !I)
			I = window.setTimeout(Q, 500);
		i = u.value;
		if (i == "" && !p)
			S()
	}
	function za(a) {
		return a == 38 || a == 63232
	}
	function xa(a) {
		return a == 40 || a == 63233
	}
	function V(a) {
		return za(a) || xa(a)
	}
	function Aa() {
		u.blur();
		z.value = "" + s;
		U(this.completeString);
		if (ea) {
			if (ia()) {
				t.submit()
			}
		} else {
			Q()
		}
	}
	function Ba() {
		if (L)
			return;
		if (r)
			r.className = P + "a";
		this.className = P + "b";
		r = this;
		for ( var a = 0; a < q.length; a++) {
			if (q[a] == r) {
				s = a;
				break
			}
		}
	}
	function Ca() {
		if (L) {
			L = false;
			Ba.call(this)
		}
	}
	function ya(a) {
		if (n == "" && j != "") {
			l = "";
			S();
			return
		}
		if (j != n || !p)
			return;
		if (!q || q.length <= 0)
			return;
		if (!va()) {
			X();
			return
		}
		var b = q.length;
		if (O)
			b -= 1;
		if (r)
			r.className = P + "a";
		if (a == b || a == -1) {
			s = -1;
			U(j);
			Y();
			z.value = "f";
			return
		} else if (a > b) {
			a = 0
		} else if (a < -1) {
			a = b - 1
		}
		z.value = "" + a;
		s = a;
		r = q.item(a);
		r.className = P + "b";
		U(r.completeString)
	}
	function Q() {
		if (I) {
			window.clearTimeout(I);
			I = null
		}
		T(w, false);
		if (x)
			T(y, false)
	}
	function X() {
		T(w, true);
		if (x)
			T(y, true);
		R();
		L = true
	}
	function va() {
		return w.visibility == "visible"
	}
	function Da(a, b, c) {
		if (c.length == 0 || c[0] < 2)
			return;
		var d = [], e = [], f = c[0], h = Math.floor((c.length - 1) / f);
		for ( var m = 0; m < h; m++) {
			d.push(c[m * f + 1]);
			e.push(c[m * f + 2])
		}
		Z(a, b, d, e)
	}
	function Z(a, b, c, d) {
		if (F > 0)
			F--;
		pa(b, c, d);
		if (b != j)
			return;
		if (I) {
			window.clearTimeout(I);
			I = null
		}
		n = b;
		Ea(v, c, d);
		s = -1;
		q = v.rows;
		if (q.length > 0) {
			X()
		} else {
			Q()
		}
	}
	function Fa(a) {
		var b;
		a.unshift(b);
		if (a.length >= 3) {
			if (a.length < 4)
				a.push([])
		}
		Z.apply(null, a)
	}
	function pa(a, b, c) {
		ba[a] = [ b, c ]
	}
	function ia() {
		Q();
		A.disabled = true;
		if (A.value != u.value) {
			z.value = "" + s;
			A.disabled = false
		} else if (G >= 3 || F >= 10) {
			z.value = "o"
		}
		return true
	}
	function S() {
		if (G >= 3)
			return false;
		if (l != j) {
			var a = ha(j), b = ba[j];
			if (b) {
				Z(null, j, b[0], b[1])
			} else {
				F++;
				if (aa) {
					var c = document.createElement("script");
					c.setAttribute("type", "text/javascript");
					c.setAttribute("charset", "utf-8");
					c.setAttribute("id", "jsonpACScriptTag");
					c.setAttribute("src", "http://suggestqueries.google.com"
							+ C
							+ "&json=t&jsonp=window.google.ac.jsonRPCDone&q="
							+ a + "&cp=" + o);
					var d = document.getElementById("jsonpACScriptTag"), e = document
							.getElementsByTagName("head")[0];
					if (d) {
						e.removeChild(d)
					}
					e.appendChild(c)
				} else {
					Ga(a)
				}
			}
			Y()
		}
		l = j;
		var f = 100;
		for ( var h = 1; h <= (F - 2) / 2; ++h) {
			f *= 2
		}
		f += 50;
		p = window.setTimeout(S, f);
		return true
	}
	function ha(a) {
		if (window.encodeURIComponent)
			return encodeURIComponent(a);
		return escape(a)
	}
	function U(a) {
		u.value = a;
		i = a
	}
	function Y() {
		u.focus()
	}
	function ua(a, b) {
		var c = 0;
		while (a) {
			c += a[b];
			a = a.offsetParent
		}
		return c
	}
	function $(a, b) {
		a.appendChild(document.createTextNode(b))
	}
	function Ea(a, b, c) {
		while (a.rows.length > 0)
			a.deleteRow(-1);
		for ( var d = 0; d < b.length; ++d) {
			var e = a.insertRow(-1);
			e.onmousedown = Aa;
			e.onmouseover = Ba;
			e.onmousemove = Ca;
			e.completeString = b[d];
			e.className = P + "a";
			var f = document.createElement("td");
			$(f, b[d]);
			f.className = P + "c";
			if (N && da.test(b[d]))
				f.style.paddingTop = "2px";
			e.appendChild(f);
			var h = document.createElement("td");
			$(h, c[d]);
			h.className = P + "d";
			e.appendChild(h)
		}
		if (O && b.length > 0) {
			var m = a.insertRow(-1);
			m.onmousedown = function(E) {
				if (E && E.stopPropagation) {
					E.stopPropagation();
					X();
					u.focus()
				} else {
					K = true
				}
				return false
			};
			var k = document.createElement("td");
			k.colSpan = 2;
			m.className = P + "e";
			var D = document.createElement("span");
			m.appendChild(k);
			k.appendChild(D);
			$(D, O);
			D.onclick = function() {
				Q();
				n = "";
				window.clearTimeout(p);
				p = null;
				z.value = "x"
			}
		}
	}
	function ga() {
		var a = null;
		try {
			a = new ActiveXObject("Msxml2.XMLHTTP")
		} catch (b) {
			try {
				a = new ActiveXObject("Microsoft.XMLHTTP")
			} catch (c) {
				a = null
			}
		}
		if (!a && typeof XMLHttpRequest != "undefined")
			a = new XMLHttpRequest;
		return a
	}
	function Ga(a) {
		if (B && B.readyState != 0 && B.readyState != 4) {
			B.abort()
		}
		if (B)
			B.onreadystatechange = Ha;
		B = ga();
		if (B) {
			B.open("GET", C + "&js=true&q=" + a + "&cp=" + o, true);
			B.onreadystatechange = function() {
				if (B.readyState == 4 && B.responseText) {
					switch (B.status) {
					case 403:
						G = 1000;
						break;
					case 302:
					case 500:
					case 502:
					case 503:
						G++;
						break;
					case 200:
						var b = B.responseText;
						if (b.charAt(0) != "<"
								&& (b.indexOf("sendRPCDone") != -1 || b
										.indexOf("Suggest_apply") != -1)) {
							eval(b)
						} else {
							F--
						}
					default:
						G = 0
					}
				}
			};
			B.send(null)
		}
	}
	function Ha() {
	}
	function sa() {
		var a = u.value;
		if (a != i)
			W(0);
		i = a
	}
	function wa() {
		K = true;
		u.blur();
		window.setTimeout(Y, 10)
	}
	function oa(a) {
		var b = 0, c = 0;
		if (Ia(a)) {
			b = a.selectionStart;
			c = a.selectionEnd
		}
		if (N) {
			var d = a.createTextRange(), e = document.selection.createRange();
			if (d.inRange(e)) {
				d.setEndPoint("EndToStart", e);
				b = d.text.length;
				d.setEndPoint("EndToEnd", e);
				c = d.text.length
			}
		}
		if (b && c && b == c)
			return b;
		return 0
	}
	function Ia(a) {
		try {
			return typeof a.selectionStart == "number"
		} catch (b) {
			return false
		}
	}
	window.google.ac = {
		install : fa,
		Suggest_apply : Da,
		jsonRPCDone : Fa,
		setFieldValue : U
	};
})();
(function() {
	function k(c, d, b) {
		var a = "on" + d;
		if (c.addEventListener)
			c.addEventListener(d, b, false);
		else if (c.attachEvent)
			c.attachEvent(a, b);
		else {
			var f = c[a];
			c[a] = function() {
				var g = f.apply(this, arguments), e = b.apply(this, arguments);
				return g == undefined ? e : (e == undefined ? g : e && g)
			}
		}
	}
	;
	var l = "/template/j2cms/images/google_toolbar.png", m = 52, n = 37, o = 75, p = 100;
	function q(c, d, b, a, f) {
		return {
			url : c,
			name : d,
			tooltip : b,
			color : a,
			yAdjust : f
		}
	}
	var r = [
			q("http://www.yetnet.cn/services/domain/", "域名注册", ".com/.net 52元", "#54a70d", [
					2, 5 ]),
			q("http://www.yetnet.cn/services/webhosting/", "虚拟主机", "150元起",
					"#3b79e7", [ 2, 5 ]),
			q("http://www.yetnet.cn/services/mail/", "企业邮局", "20元起",
					"#f3e76e", [ 3, 7 ]),
			q("http://www.yetnet.cn/services/vpsserver/", "VPS主机", "国内/美国/香港VPS",
					"#96cfec", [ 4, 9 ]) ], s = [];
	function t(c, d) {
		while (d && c != d)
			d = d.parentNode;
		return d == c
	}
	function v(c, d) {
		return function(b) {
			b = b || window.event;
			var a = s[d], f = c == "mouseover", g = b.target || b.srcElement, e = b.relatedTarget
					|| (f ? b.fromElement : b.toElement), h = !e
					|| t(a.element, e), i = t(a.element, g);
			if (f && !h || !f && (!e || i && !h)) {
				var j = a.icon;
				j.mouseTimeout = window.clearTimeout(j.mouseTimeout);
				var u = f ? 1 : -1;
				if (j.b != u)
					j.mouseTimeout = window.setTimeout(j.e(u, undefined),
							f ? p / 3 : p)
			}
		}
	}
	function w(c, d, b) {
		k(c, d, v(d, b))
	}
	function x(c, d, b) {
		this.c = c;
		var a = document.createElement("div"), f = c.color, g = "background-color:"
				+ f, e = "width:1px;height:1px;" + g + ";float:", h = '<div style="height:1px;overflow:hidden"><div style="'
				+ e + 'left"></div><div style="' + e + 'right"></div></div>', i = "margin:0 1px;height:1px;overflow:hidden;"
				+ g;
		a.innerHTML = '<div style="display:none;position:absolute;top:0;left:0;z-index:2;background:#fff;cursor:pointer;cursor:hand"><a href="'
				+ d
				+ '" style="color:#444;text-decoration:none" target=_blank><div style="'
				+ i
				+ '"></div><div style="text-align:center;border-left:1px solid;border-right:1px solid;border-color:'
				+ f
				+ '">'
				+ h
				+ '<div style="margin:0 auto;white-space:nowrap;padding:.2em 0 0"><font size=-1><span>'
				+ b
				+ "</span></font></div>"
				+ h
				+ '</div><div style="'
				+ i
				+ '"></div><div style="height:4px" align="center"><div style="position:relative;top:-1px;z-index:3;width:8px;overflow:hidden;margin:0 auto;height:4px;background:no-repeat -260px '
				+ -c.spriteCoordinateList[0].y + 'px"></div></div></a></div>';
		this.h = a.getElementsByTagName("span")[0];
		document.body.appendChild(a);
		a.firstChild.firstChild.lastChild.firstChild.style.backgroundImage = "url("
				+ l + ")";
		this.element = a.firstChild;
		var j = s.length;
		s.push({
			icon : c,
			element : this.element
		});
		w(this.element, "mouseover", j);
		w(this.element, "mouseout", j)
	}
	x.prototype.play = function(c) {
		var d = this.c.element.firstChild, b = {
			left : -d.offsetLeft,
			top : 0
		};
		while (d) {
			b.left += d.offsetLeft;
			b.top += d.offsetTop;
			d = d.offsetParent
		}
		var a = this.element.style;
		if (a.display == "none") {
			a.visibility = "hidden";
			a.display = "block"
		}
		var f = this.element.offsetHeight, g = this.h.offsetWidth + 14;
		if (a.visibility == "hidden") {
			a.display = "none";
			a.visibility = "visible"
		}
		a.width = g + "px";
		b.left -= (g - this.c.element.parentNode.offsetWidth) / 2;
		b.top -= f - 3;
		b.top += 20 * Math.pow(1 - c / this.c.frames, 3);
		a.left = b.left + "px";
		a.top = b.top + "px";
		if (c == 0 || this.c.b < 0)
			a.display = "none";
		else {
			a.display = "";
			var e = c / this.c.frames;
			if ("opacity" in a)
				a.opacity = e;
			else if ("MozOpacity" in a)
				a.MozOpacity = e;
			else if ("KhtmlOpacity" in a)
				a.KhtmlOpacity = e;
			else if ("filter" in a)
				a.filter = "alpha(opacity=" + e * 100 + ")"
		}
	};
	function y(c, d, b, a, f) {
		this.element = c;
		this.mouseTimeout = null;
		this.frames = d.length - 1;
		this.spriteCoordinateList = d;
		this.color = b;
		this.d = null;
		this.g = c.getElementsByTagName("div")[1];
		this.i = new x(this, a, f);
		this.b = -1;
		this.a = 1;
		var g = s.length;
		s.push({
			icon : this,
			element : c
		});
		w(c, "mouseover", g);
		w(c, "mouseout", g)
	}
	y.prototype.e = function(c, d) {
		var b = this;
		return function() {
			b.f(c, d)
		}
	};
	y.prototype.f = function(c, d) {
		if (c) {
			this.b = c;
			this.mouseTimeout = window.clearTimeout(this.mouseTimeout);
			this.d = window.clearTimeout(this.d)
		}
		if (typeof d != "undefined")
			this.a = d;
		var b = this.spriteCoordinateList[this.a];
		this.g.style.backgroundPosition = -b.x + "px " + -b.y + "px";
		this.i.play(this.a);
		var a = this.element.style;
		if (this.b < 0) {
			a.color = "#444";
			a.textDecoration = "none"
		} else {
			a.color = this.color;
			a.textDecoration = "underline"
		}
		this.a += this.b;
		if (this.a > this.frames)
			this.a = this.frames - 1;
		else if (this.a < 0)
			this.a = 1;
		else
			this.d = window.setTimeout(this.e(undefined, undefined), o)
	};
	k(
			window,
			"load",
			function() {
				try {
					document.execCommand("BackgroundImageCache", false, true)
				} catch (c) {
				}
				var d = '<table style="margin:2em auto;border-collapse:collapse;line-height:1.4em" cellpadding="3" cellspacing="2" border="0"><tr>';
				for ( var b = 0; b < r.length; ++b) {
					var a = r[b];
					var f = [], g = n * b;
					for ( var e = 0; e < 7; ++e)
						if (e > 4)
							f.push({
								x : m * 4,
								y : g - a.yAdjust[e - 5]
							});
						else
							f.push({
								x : m * e,
								y : g
							});
					a.coordinates = f;
					d += '<td style="text-align:center;padding:0 .35em 0 .4em;margin:0;cursor:pointer;cursor:hand"><a style="color:#444;text-decoration:none;" href="'
							+ a.url
							+ '" target=_blank><div><div style="width:52px;height:37px;margin:.5em auto;cursor:pointer;cursor:hand;background: no-repeat 0 '
							+ -g
							+ 'px"></div><span style="white-space:nowrap"><font size=-1>'
							+ a.name + "</font></span></div></a></td>"
				}
				d += "</tr></table>";
				var h = document.getElementById("tb");
				h.innerHTML = d;
				var i = h.getElementsByTagName("a");
				for ( var b = 0; b < i.length; ++b) {
					i[b].firstChild.firstChild.style.backgroundImage = "url("
							+ l + ")";
					new y(i[b], r[b].coordinates, r[b].color, r[b].url,
							r[b].tooltip)
				}
			});
})();