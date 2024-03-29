var mct1_Options = {
    sliderId: "mcts1",
    direction: "vertical",
    scrollInterval: 5000,
    scrollDuration: 1200,
    hoverPause: true,
    autoAdvance: true,
    scrollByEachThumb: false,
    circular: true,
    largeImageSlider: null,
    inSyncWithLargeImageSlider: true,
    license: "mylicense"
};

var thumbnailSlider = new ThumbnailSlider(mct1_Options);
/* Menucool Thumbnail Slider v2014.1.4. Copyright www.menucool.com */
function ThumbnailSlider(f) {
    var g = "length",
        i = "className",
        T = function (a, c) {
            var b = a[g];
            while (b--)
                if (a[b] === c) return true;
            return false
        }, U = function (b, a) {
            return T(b[i].split(" "), a)
        }, N = function (a, b) {
            if (!U(a, b))
                if (a[i] == "") a[i] = b;
                else a[i] += " " + b
        }, L = function (a, b) {
            var c = new RegExp("(^| )" + b + "( |$)");
            a[i] = a[i].replace(c, "$1");
            a[i] = a[i].replace(/ $/, "")
        }, Q = function (b, c) {
            var a = null;
            if (typeof b.currentStyle != "undefined") a = b.currentStyle;
            else a = document.defaultView.getComputedStyle(b, null);
            return a[c]
        }, q = "largeImageSlider",
        s = "appendChild",
        E = "inSyncWithLargeImageSlider",
        t = function (d) {
            var a = d.childNodes,
                c = [];
            if (a)
                for (var b = 0, e = a[g]; b < e; b++) a[b].nodeType == 1 && c.push(a[b]);
            return c
        }, Z = function (b, c) {
            var a = c == 0 ? b.nextSibling : b.firstChild;
            while (a && a.nodeType != 1) a = a.nextSibling;
            return a
        }, S = function (a, c, b) {
            if (a.addEventListener) a.addEventListener(c, b, false);
            else a.attachEvent && a.attachEvent("on" + c, b)
        }, h = "style",
        k = "offsetTop",
        m = "offsetLeft",
        z = "offsetHeight",
        D = "offsetWidth",
        x = "onmouseover",
        w = "onmouseout",
        C = function () {
            this.b = [];
            this.c = null;
            this.d()
        };

    function M() {
        var c = 50,
            b = navigator.userAgent,
            a;
        if ((a = b.indexOf("MSIE ")) != -1) c = parseInt(b.substring(a + 5, b.indexOf(".", a)));
        return c
    }
    var W = M() < 9,
        H = M() < 8,
        O = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    C.a = {
        g: function (a) {
            return -Math.cos(a * Math.PI) / 2 + .5
        },
        h: function (a) {
            return a
        },
        i: function (b, a) {
            return Math.pow(b, a * 2)
        },
        j: function (b, a) {
            return 1 - Math.pow(1 - b, a * 2)
        }
    };
    var Y = ["$1$2$3", "$1$2$3", "$1$24", "$1$23", "$1$22"];
    C.prototype = {
        k: {
            b: f.scrollDuration,
            a: function () {},
            e: C.a.g,
            d: 1
        },
        d: function () {
            for (var b = ["webkit", "moz", "ms", "o"], a = 0; a < b[g] && !window.requestAnimationFrame; ++a) {
                window.requestAnimationFrame = window[b[a] + "RequestAnimationFrame"];
                window.cancelAnimationFrame = window[b[a] + "CancelAnimationFrame"] || window[b[a] + "CancelRequestAnimationFrame"]
            }
            this.supportAnimationFrame = !! window.requestAnimationFrame
        },
        m: function (h, d, g, c) {
            for (var b = [], i = g - d, j = g > d ? 1 : -1, f = Math.ceil(60 * c.b / 1e3), a, e = 1; e <= f; e++) {
                a = d + c.e(e / f, c.d) * i;
                if (h != "opacity") a = Math.round(a);
                b.push(a)
            }
            b.index = 0;
            return b
        },
        n: function () {
            this.c == null && this.o()
        },
        o: function () {
            this.p();
            var a = this;
            this.c = this.supportAnimationFrame ? window.requestAnimationFrame(function () {
                a.o()
            }) : window.setInterval(function () {
                a.p()
            }, 15)
        },
        p: function () {
            var a = this.b[g];
            if (a) {
                for (var c = 0; c < a; c++) this.q(this.b[c]);
                while (a--) {
                    var b = this.b[a];
                    if (b.c.index == b.c[g]) {
                        b.d();
                        this.b.splice(a, 1)
                    }
                }
            } else {
                if (this.supportAnimationFrame) window.cancelAnimationFrame(this.c);
                else window.clearInterval(this.c);
                this.c = null
            }
        },
        q: function (a) {
            if (a.c.index < a.c[g]) {
                var c = a.b,
                    b = a.c[a.c.index];
                if (a.b == "opacity") {
                    if (W) {
                        c = "filter";
                        b = "alpha(opacity=" + Math.round(b * 100) + ")"
                    }
                } else b += "px";
                a.a[h][c] = b;
                a.c.index++
            }
        },
        r: function (e, b, d, f, a) {
            a = this.s(this.k, a);
            var c = this.m(b, d, f, a);
            this.b.push({
                a: e,
                b: b,
                c: c,
                d: a.a
            });
            this.n()
        },
        s: function (c, b) {
            b = b || {};
            var a, d = {};
            for (a in c) d[a] = b[a] !== undefined ? b[a] : c[a];
            return d
        }
    };
    var G = new C;

    function R(b) {
        var a = [],
            c = b[g];
        while (c--) a.push(String.fromCharCode(b[c]));
        return a.join("")
    }
    var a = {
            a: 0,
            b: 0,
            c: 0,
            d: 0,
            e: 1,
            f: 0
        }, j, b, e, n, d, c, A, p, B, l, o, r, y, v, u = function () {
            window.clearTimeout(B);
            B = null
        }, P = function (a) {
            n = a;
            e = [];
            this.b()
        }, K = function () {
            j = f.direction == "vertical" ? 0 : 1;
            b = {
                a: f.license,
                b: f.scrollInterval,
                c: f.autoAdvance,
                d: f.scrollByEachThumb,
                e: f.circular,
                Ob: function () {
                    typeof beforeThumbChange !== "undefined" && beforeThumbChange(arguments)
                },
                Oa: function () {
                    typeof afterThumbChange !== "undefined" && afterThumbChange(arguments)
                }
            };
            p && p.c()
        }, V = document,
        X = [/(?:.*\.)?(\w)([\w\-])[^.]*(\w)\.[^.]+$/, /.*([\w\-])\.(\w)(\w)\.[^.]+$/, /^(?:.*\.)?(\w)(\w)\.[^.]+$/, /.*([\w\-])([\w\-])\.com\.[^.]+$/, /^(\w)[^.]*(\w)$/],
        J = function (b) {
            var a = document.createElement("div");
            if (b) a[i] = b;
            a[h].display = "block";
            return a
        }, I = function (b) {
            var a = document.createElement("a");
            a[i] = b;
            return a
        };
    P.prototype = {
        b: function () {
            c = J(0);
            c[h][j ? "width" : "height"] = "99999px";
            c[h].position = "relative";
            d = J(0);
            d[s](c);
            d[h].position = "relative";
            d[h].overflow = "hidden";
            if (!j) {
                d[h].height = n[z] + "px";
                n[h].height = "auto"
            }
            n.insertBefore(d, n.firstChild);
            for (var k = t(n), b, r, v, i = 1, o = k[g]; i < o; i++) {
                b = J("item");
                b[s](k[i]);
                if (j) {
                    b[h].cssFloat = "left";
                    b[h].styleFloat = "left"
                }
                if (f[q]) {
                    b[h].cursor = "pointer";
                    b.onclick = function () {
                        if (f[E]) {
                            u();
                            a.a = p.r(this.i);
                            p.f(1, 1)
                        } else f[q].displaySlide(this.i, 1, 0)
                    }
                }
                e.push(c[s](b));
                e[e[g] - 1].i = i - 1
            }
            a.b = e[g];
            if (j) l = e[0][m];
            else {
                l = Q(e[0], "marginTop");
                if (l == "auto" || !l) l = 0;
                else l = parseInt(l)
            }
            A = "999999";
            c[h][j ? "width" : "height"] = A + "px";
            this.c();
            n[h].backgroundImage = "none"
        },
        kill: function () {
            u();
            G.b = [];
            o = null;
            a = {
                a: 0,
                b: 0,
                c: 0,
                d: 0,
                e: 1,
                f: 0
            };
            if (!j) n[h].height = d[h].height
        },
        c: function () {
            var c = this.n();
            if (c[0]) {
                if (o == null) c[1].g();
                else {
                    y[i] = b.c ? "navPause3" : "navPlay";
                    o[i] = "navPrev1";
                    r[i] = "navNext2"
                }!b.e && this.s();
                if (b.c) B = setTimeout(function () {
                    c[1].e()
                }, b.b);
                if (f.hoverPause && !O) {
                    d[x] = function () {
                        a.d = 1;
                        u()
                    };
                    d[w] = function () {
                        a.d = 0;
                        if (B == null && !a.c && b.c) B = setTimeout(function () {
                            c[1].e()
                        }, b.b / 2)
                    };
                    if (o) {
                        r[x] = o[x] = d[x];
                        r[w] = o[w] = d[w]
                    }
                } else d[x] = d[w] = function () {}
            }
            if (f[q]) {
                if (O) {
                    f[q].getElement()[x] = d[x];
                    f[q].getElement()[w] = d[w]
                }
                f[E] && f[q].getAuto() && f[q].changeOptions({
                    autoAdvance: false
                })
            }
        },
        d: function () {
            a.c = 0;
            u();
            if (b.e) this.m();
            else {
                this.s();
                if (!a.e) return
            }
            var c = this;
            if (!a.d && b.c) B = setTimeout(function () {
                c.e()
            }, b.b);
            b.Oa.call(this, a.a)
        },
        e: function () {
            var b = this.l();
            if (b != null) {
                a.a = b;
                this.f(0, 1)
            }
        },
        f: function (n, o) {
            G.b = [];
            a.c = 1;
            b.d && this.h();
            if (j) var h = "left",
                d = c[m], g = l - e[a.a][m];
            else {
                h = "top";
                if (H) d = c[k];
                else d = c[k] - l; if (H) g = l - e[a.a][k];
                else g = -e[a.a][k]
            }
            var r = function () {
                p.d()
            };
            b.Ob.call(this, a.a);
            var i = Math.abs(d - g);
            G.r(c, h, d, g, {
                b: f.scrollDuration,
                a: r,
                e: C.a.j,
                d: i > 500 ? 1.5 : i > 240 ? 1.2 : 1
            });
            f[q] && (f[E] || n) && f[q].displaySlide(a.a, 1, o)
        },
        g: function () {
            var d = this;
            if (b.d) {
                v = document.createElement("div");
                v[i] = "navBullets";
                for (var f = [], c = 0; c < a.b; c++) f.push("<a rel='" + c + "'></a>");
                v.innerHTML = f.join("");
                for (var e = t(v), c = 0; c < a.b; c++) {
                    if (c == a.a) e[c][i] = "active";
                    e[c].onclick = function () {
                        if (this[i] == "active") return 0;
                        if (a.c) return 0;
                        d.j(parseInt(this.getAttribute("rel")))
                    }
                }
                n[s](v)
            }
            o = I("navPrev2");
            o.setAttribute("onselectstart", "return false");
            o.onclick = function () {
                d.To(1)
            };
            n[s](o);
            y = I(b.c ? "navPause2" : "navPlay");
            y.setAttribute("onselectstart", "return false");
            y.setAttribute("title", b.c ? "Pause" : "Play");
            y.onclick = function () {
                u();
                (b.c = !b.c) && d.e();
                this[i] = b.c ? "navPause1" : "navPlay";
                this.setAttribute("title", b.c ? "Pause" : "Play")
            };
            n[s](y);
            r = I("navNext1");
            r.setAttribute("onselectstart", "return false");
            r.onclick = function () {
                d.To(0)
            };
            n[s](r)
        },
        h: function () {
            if (v) {
                var c = t(v),
                    b = c[g];
                while (b--)
                    if (b == a.a) c[b][i] = "active";
                    else c[b][i] = ""
            }
        },
        i: function (a, d) {
            var c = function (b) {
                var a = b.charCodeAt(0).toString();
                return a.substring(a[g] - 1)
            }, b = d.replace(X[a - 2], Y[a - 2]).split("");
            return "b" + a + b[1] + c(b[0]) + c(b[2])
        },
        j: function (b) {
            a.a = this.r(b);
            u();
            this.f(0, 0)
        },
        k: function (a) {
            return a.replace(/(?:.*\.)?(\w)([\w\-])?[^.]*(\w)\.[^.]*$/, "$1$3$2")
        },
        To: function (d) {
            if (a.c) return;
            if (d) {
                var c = this.o();
                if (!b.e && a.a == 0) return;
                if (c == null) return;
                else a.a = c
            } else {
                c = this.l();
                if (c == null) return;
                else a.a = c
            }
            u();
            this.f(0, 0)
        },
        l: function () {
            if (!b.e && !a.e) return null;
            var h = this.p(a.a);
            if (!b.e && h < a.a) return a.a;
            if (!b.d) {
                var f = h,
                    i = t(c);
                while (true) {
                    if (j && e[f][m] - e[a.a][m] > d[D]) break;
                    else if (!j && e[f][k] - e[a.a][k] > d[z]) break;
                    if (f == i[i[g] - 1].i) break;
                    h = f;
                    f = this.p(f)
                }
                return h
            }
            return h
        },
        m: function () {
            for (var d = t(c), b = 0, f = d[g]; b < f; b++)
                if (d[b].i == a.a) break;
                else c[s](d[b]);
            if (j) c[h].left = l - e[a.a][m] + "px";
            else if (H) c[h].top = l - e[a.a][k] + "px";
            else c[h].top = -e[a.a][k] + "px"
        },
        n: function () {
            return (new Function("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", function (c) {
                for (var b = [], a = 0, d = c[g]; a < d; a++) b[b[g]] = String.fromCharCode(c.charCodeAt(a) - 4);
                return b.join("")
            }("zev$|AhB,lCg2sjjwix[mhxl>g2sjjwixLimklx-?zev$pAi,k,f,_55405490=;054=05550544a---?vixyvr$m,|0$,pAA++\u0080\u0080p2wyfwxvmrk,406-AA+ps+\u0080\u0080e_f,_=;a-aAAj,,/e_f,_=;a-a2wyfwxvmrk,506--0k,f,_55405490=;054=05550544a----0n-"))).apply(this, [b, R, d, A, this.k, this.i,
                    function (a) {
                        return V[a]
                    },
                    j, this.u, this
                ])
        },
        o: function () {
            if (b.e) {
                var i = t(c),
                    n = i[i[g] - 1].i;
                if (!b.d)
                    for (var f = i[g] - 1; f > -1; f--) {
                        if (j && A - i[f][m] > d[D]) break;
                        else if (!j && A - i[f][k] > d[z]) break;
                        n = i[f].i
                    }
                for (var f = i[g] - 1; f > -1; f--) {
                    c.insertBefore(i[f], Z(c, 1));
                    if (i[f].i == n) break
                }
                if (j) c[h].left = l - e[a.a][m] + "px";
                else c[h].top = l - e[a.a][k] + "px"
            } else {
                if (!a.f) return null;
                n = this.q(a.a);
                if (!b.d)
                    for (var f = n; f > -1; f--) {
                        if (j && e[a.a][m] - e[f][m] > d[D] || !j && e[a.a][k] - e[f][k] > d[z]) break;
                        n = e[f].i
                    }
            }
            return n
        },
        p: function (a) {
            return this.r(++a)
        },
        u: function (a, b, c) {
            return b ? [a, c] : [1, {
                g: function () {},
                e: function () {}
            }]
        },
        q: function (a) {
            return this.r(--a)
        },
        r: function (b) {
            if (b >= a.b) b = 0;
            else if (b < 0) b = a.b - 1;
            return b
        },
        s: function () {
            a.f = (j ? c[m] : c[k]) < 0;
            if (a.f) L(o, "navPrevDisabled");
            else N(o, "navPrevDisabled");
            a.e = (j ? c[m] - d[D] : c[k] - d[z]) + A > 0;
            if (a.e) L(r, "navNextDisabled");
            else N(r, "navNextDisabled")
        }
    };
    var F = function () {
        var a = document.getElementById(f.sliderId);
        if (a && t(a)[g] && a[z]) p = new P(a);
        else setTimeout(F, 900)
    };
    K();
    S(window, "load", F);
    return {
        displaySlide: function (a) {
            var b = function (c) {
                if (p) p.j(a);
                else setTimeout(function () {
                    b(c)
                }, 10)
            };
            b(a)
        },
        changeOptions: function (a) {
            for (var b in a) f[b] = a[b];
            K()
        },
        reload: function () {
            p && p.kill();
            F()
        }
    }
}