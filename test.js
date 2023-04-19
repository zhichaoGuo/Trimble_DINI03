var ChineseChat_XiaoIceApi;
(function() {
    function hu() {
        u && (n = ChatHelper.Config,
        ku(),
        au(),
        cu(),
        pu(),
        tf(),
        hf())
    }
    function cu() {
        var t, r, u;
        ff();
        ef();
        nf();
        uf();
        t = _ge("ev_tb_maxclose");
        sj_be(t, "click", function() {
            bu()
        });
        sj_be(i, "click", function() {
            ei ? ei = !1 : wu(!0)
        });
        sj_be(_ge(ur), "click", vr);
        n.IsMobileChat && (tt = window.screen.width - 69,
        tt > 348 ? tt = 348 : tt < 270 && (tt = 270),
        r = tt - 72,
        _ge("ev_talkbox_max").style.width = tt + "px",
        _ge("ev_send_text").style.width = r + "px");
        u = _ge(ti);
        sj_be(u, "keydown", function(n) {
            n.keyCode == 13 && (vr(),
            sj_pd(n))
        });
        setInterval(lu, 50)
    }
    function lu() {
        var n = window.innerHeight - 300, t, i;
        yi != n && (yi = n,
        n < 388 ? (_ge("ev_talkbox").style.height = n + "px",
        _ge("ev_tb_header_dropdown_background").style.height = n + "px",
        t = n + 91,
        _ge("ev_disable_popup_background").style.height = t + "px",
        _ge("ev_iframe_talk").style.height = t + "px",
        _ge("ev_enlarge_background").style.height = t + "px",
        n < 282 ? (i = n - 131,
        i < 51 && (i = 51),
        _ge("ev_disable_popup_setting").style.top = i + "px") : _ge("ev_disable_popup_setting").style.top = "151px") : (_ge("ev_talkbox").style.height = "388px",
        _ge("ev_tb_header_dropdown_background").style.height = "388px",
        _ge("ev_disable_popup_background").style.height = "479px",
        _ge("ev_iframe_talk").style.height = "479px",
        _ge("ev_enlarge_background").style.height = "479px"))
    }
    function au() {
        var n = u.parentElement
          , t = _ge("b_content");
        t && t.insertBefore(u, t.firstChild);
        n && n.parentElement && n.tagName.toLowerCase() == "li" && Lib.CssClass.contains(n, "b_ans") && n.parentElement.removeChild(n)
    }
    function vr() {
        var r = _ge(ti)
          , t = r.value
          , f = (new Date).getTime();
        if (t) {
            sj_cook.setNoCrumbs(sr, "0", !0, "/", 10080);
            ki && (sj_cook.clear(ai),
            ki = !1);
            r.value = "";
            var u = it(t, !1, !1, "", "1")
              , n = _ge(a)
              , i = MsnShared.getElementsByClassName("ev_zo_typing", "div", n);
            i && i.length > 0 ? n.insertBefore(u, i[0].parentElement) : n.appendChild(u);
            n.scrollTop = n.scrollHeight;
            ut == 0 && pr();
            ut++;
            hi(t, "chatbox");
            p() && Log.Log("DHTMLClick", h, "sendText", !1, "UQ", t, "ST", f.toString())
        }
    }
    function hi(i, r) {
        var e, f, u, c, l;
        n.ZoChatV2Url && (e = !1,
        oi == "True" && (e = !0),
        f = (new Date).getTime(),
        i = Aes.encrypt(i, n.ZoAESPassword, n.ZoAESBitCount),
        u = sj_gx(),
        u.timeout = 1e4,
        u.open("POST", n.ZoChatV2Url, !0),
        sj_be(u, "readystatechange", function() {
            var n, i;
            u.readyState == 4 && (f = (new Date).getTime() - f,
            n = !1,
            r != "disablechat" ? (u.status == 200 && u.responseText ? (n = af(u.responseText, r),
            n || nr()) : (nr(),
            i = ["脑子不转啦，等我休息一下", "我刚刚想说啥来着呢...", "你猜我会回复你啥？", "词穷了，等我歇会儿", "（让我想想怎么回复你）"],
            rr(i[Math.floor(Math.random() * i.length)], "1")),
            p() && (n ? Log.Log("SuccessGet", h, "getZoChatBySendText", !1, "timeTaken", f.toString(), "resDT", fr, "resText", gr, "AnswerFeed", fu, "EmotionInfo", eu, "CustomLog", ou) : Log.Log("FailGet", h, "getZoChatBySendText", !1, "timeTaken", f.toString()))) : (u.status == 200 && u.responseText ? rr("再见啦~如果想我的话，在必应国内版搜索【小冰】，我就会出来陪你啦~", "1") : rr("不好意思，本次操作失败了~已反馈，请您稍后再试~", "1"),
            MsnShared.show(y),
            MsnShared.hide(v),
            sj_cook.set(vt, ii, o),
            d.className = g,
            b.innerHTML = ht,
            t = o,
            MsnShared.hide(ft),
            MsnShared.hide(s),
            setTimeout(rf, 7e3),
            p() && (n ? Log.Log("SuccessDiable", h, "disableChatbot", !1, "timeTaken", f.toString()) : Log.Log("FailDisable", h, "disableChatbot", !1, "timeTaken", f.toString()))))
        }),
        c = (new Date).getTime().toString(),
        l = {
            senderId: null,
            senderNickname: "",
            content: {
                text: i,
                imageUrl: "",
                imageBase64: null,
                audioUrl: "",
                audioBase64: null
            },
            msgId: yu(),
            timestamp: c
        },
        u.setRequestHeader("Content-Type", "application/json"),
        u.send(JSON.stringify(l)))
    }
    function vu(n, t) {
        var r, i, u;
        ut--;
        n && n.length > 0 && (r = _ge(a),
        i = MsnShared.getElementsByClassName("ev_zo_typing", "div", r),
        i && i.length > 0 ? ut == 0 ? (i[0].innerHTML = "",
        yr(i[0], n),
        MsnShared.removeClass(i[0], "ev_zo_typing")) : (u = it("", !0, !1, n, t),
        r.insertBefore(u, i[0].parentElement)) : (u = it("", !0, !1, n, t),
        r.appendChild(u)),
        r.scrollTop = r.scrollHeight,
        fr = (new Date).getTime().toString())
    }
    function it(t, i, u, f, e) {
        var p, v, s, c, y, h, w, o, b, l;
        return u && (p = _ge(a),
        v = MsnShared.getElementsByClassName("ev_zo_typing", "div", p),
        v && v.length > 0) ? null : (s = sj_ce("div", null, "ev_msg_wrapper"),
        i ? (h = sj_ce("div", "ev_zo_img", "ev_zo_img"),
        lf() && (h.className = "ev_zo_img_dm"),
        s.appendChild(h)) : (c = typeof Identity != "undefined" && Identity.wlProfile && Identity.wlProfile(),
        c && c.img ? (y = sj_ce("img", null, "ev_my_img"),
        y.src = c.img,
        s.appendChild(y)) : (h = sj_ce("div", null, "ev_my_img"),
        s.appendChild(h))),
        w = i ? "ev_zo_msg" : "ev_my_msg",
        o = sj_ce("div", null, w),
        n.IsMobileChat && (b = tt - 146,
        o.style.maxWidth = b + "px"),
        u ? (o.innerHTML = "<span><\/span>",
        MsnShared.addClass(o, "ev_zo_typing")) : i && f && f.length > 0 ? yr(o, f) : e == "2" ? (l = sj_ce("img", "ev_zo_image", "ev_zo_image"),
        l.src = t,
        MsnShared.removeClass(o, "ev_zo_msg"),
        s.appendChild(l),
        l.onclick = function() {
            nt.className = "ev_show_enlarge_img";
            pt.className = "ev_enlarge_img";
            pt.src = t;
            r.src = t;
            r.complete ? br() : r.onload = function() {
                br()
            }
        }
        ) : o.innerText = t,
        s.appendChild(o),
        s)
    }
    function yr(n, t) {
        var i = sj_ce("span", null, null);
        i.innerText = t;
        n.appendChild(i)
    }
    function rt() {
        return ((1 + Math.random()) * 65536 | 0).toString(16).substring(1)
    }
    function yu() {
        return (rt() + rt() + rt() + rt() + rt() + rt() + rt() + rt()).toLowerCase()
    }
    function pu() {
        t == o ? (d.className = g,
        b.innerHTML = ht) : t == yt ? (ot.className = g,
        b.innerHTML = pi,
        v.src = n.IsDarkMode ? ui + "?webthemedark=1" : ui) : (st.className = g,
        b.innerHTML = wi,
        v.src = n.IsDarkMode ? fi + "?webthemedark=1" : fi);
        MsnShared.show(u)
    }
    function pr() {
        var t = it("", !0, !0, "", ""), n;
        t && (n = _ge(a),
        n.appendChild(t),
        n.scrollTop = n.scrollHeight)
    }
    function nr() {
        var i, n, t;
        if (ut--,
        ut == 0 && (i = _ge(a),
        n = MsnShared.getElementsByClassName("ev_zo_typing", "div", i),
        n && n.length > 0))
            for (t = 0; t < n.length; t++)
                n[t].parentElement.parentElement.removeChild(n[t].parentElement)
    }
    function wu(n) {
        if (e && i) {
            MsnShared.removeClass(u, "ev_talkbox_wrapper_min");
            si && MsnShared.removeClass(u, "ev_talkbox_wrapper_mintob");
            MsnShared.addClass(u, "ev_talkbox_wrapper");
            MsnShared.show(e);
            MsnShared.hide(i);
            var r = _ge(a);
            r.scrollTop = r.scrollHeight;
            n && (tr(li),
            (t == yt || t == ri) && (MsnShared.show(v),
            MsnShared.hide(y)),
            p() && Log.Log("DHTMLClick", h, "maximizeZo", !1, "botType", t))
        }
    }
    function bu() {
        e && i && (MsnShared.removeClass(u, "ev_talkbox_wrapper"),
        MsnShared.addClass(u, "ev_talkbox_wrapper_min"),
        si && MsnShared.addClass(u, "ev_talkbox_wrapper_mintob"),
        MsnShared.hide(e),
        MsnShared.show(i),
        tr(or),
        t == o ? (ni(),
        i.className = "ev_talkbox_cn_min",
        f.className = typeof _ge("ent-car-exp") != "undefined" && _ge("ent-car-exp") !== null ? "ev_min_cn_img_casol" : "ev_min_cn_img") : (sb_ct(gt),
        sb_ct(dt),
        sb_ct(lt),
        f.style.cssText = ";background-image: url(" + n.VirtualCharacterEntryUrl + ")",
        i.className = "ev_talkbox_virtual_min",
        f.className = "ev_min_virtual_img"),
        p() && Log.Log("DHTMLClick", h, "minimizeZo", !1, "botType", t))
    }
    function tr(n) {
        n == li || n == or ? sj_cook.set(er, nu, n) : sj_cook.clear(er)
    }
    function p() {
        return typeof Log != "undefined" && Log !== null && typeof Log.Log != "undefined"
    }
    function ku() {
        var r, lt, at, ci, tt, bt, h, kt, it, rt, dt, gt, ut, ni, p, ui, tr, ir;
        t = sj_cook.get(vt, ii);
        t == null && (t = o);
        t != yt && t != ri || n.iframeTalkStatus && navigator.cookieEnabled || (t = o,
        sj_cook.set(vt, ii, t));
        n.HookHyperlink && (oi = sj_cook.get(vt, ar),
        oi == null && (oi = "false"),
        sj_cook.clear(ar));
        r = sj_ce("div", null, "ev_tb_header");
        c.innerText = "关闭";
        lt = sj_ce("div", "ev_disable_popup_setting_pop", "ev_disable_popup_setting_pop");
        lt.innerText = "确认要关闭吗？";
        at = sj_ce("div", "ev_disable_popup_setting_body", "ev_disable_popup_setting_body");
        at.innerText = "接下来的很长一段时间，你都不会看到我了";
        var wt = sj_ce("div", "ev_disable_popup_setting_bottom", "ev_disable_popup_setting_bottom")
          , ei = sj_ce("div", "ev_disable_popup_setting_btn1", "ev_disable_popup_setting_btn1")
          , hi = sj_ce("div", "ev_disable_popup_setting_btn2", "ev_disable_popup_setting_btn2");
        if (ei.innerText = "确定",
        hi.innerText = "再想想",
        wt.appendChild(ei),
        wt.appendChild(hi),
        s.appendChild(lt),
        s.appendChild(at),
        s.appendChild(wt),
        e.appendChild(c),
        e.appendChild(ft),
        e.appendChild(s),
        ci = sj_ce("div", "ev_tb_disable", "ev_tb_disable"),
        r.appendChild(ci),
        tt = sj_ce("div", "ev_tb_header_text", "ev_tb_disable_header_text"),
        tt.appendChild(b),
        tt.appendChild(w),
        r.appendChild(tt),
        bt = sj_ce("span", "ev_tb_maxclose", "ev_tb_disable_close"),
        r.appendChild(bt),
        bt.appendChild(sj_ce("span", "ev_tb_maxclose_img", "ev_tb_close_img")),
        d.innerText = ht,
        ot.innerText = pi,
        st.innerText = wi,
        h = sj_ce("div", "ev_tb_header_dropdown_button", "ev_tb_header_dropdown_button"),
        kt = sj_ce("div", "ev_tb_header_dropdown_text", "ev_tb_header_dropdown_text"),
        kt.innerText = "点击切换聊天对象",
        k.appendChild(kt),
        k.appendChild(h),
        k.appendChild(sj_ce("div", "ev_tb_header_dropdown_background", null)),
        h.appendChild(d),
        h.appendChild(ot),
        h.appendChild(st),
        it = sj_ce("div", "ev_send_input", null),
        rt = sj_ce("textarea", ti, "ev_send_text"),
        rt.setAttribute("type", "text"),
        rt.setAttribute("placeholder", n.placeHolder),
        dt = sj_ce("div", ur, "ev_send_button"),
        dt.appendChild(sj_ce("div", "ev_send_button_img", "ev_send_button_img")),
        it.appendChild(rt),
        it.appendChild(dt),
        e.appendChild(r),
        gt = sj_ce("div", "ev_privacy_text_top", null),
        gt.innerText = "由红棉小冰提供的虚拟人类已唤醒，可以随时开始聊天啦",
        n.ShowTrendingQuery) {
            var ni = sj_ce("div", "ev_privacy_text_bottom_text_bubble", null)
              , p = sj_ce("div", "ev_privacy_text_bottom_bubble", null)
              , li = sj_ce("div", "ev_bubblelist_title", null);
            li.innerText = "Bing热搜";
            p.appendChild(li);
            ut = sj_ce("marquee", "ev_bubblelist_0", "ev_bubblelist");
            ut.innerHTML = "<span><\/span>";
            MsnShared.addClass(ut, "ev_zo_typing");
            p.appendChild(ut)
        } else
            ni = sj_ce("div", "ev_privacy_text_bottom_text", null),
            p = sj_ce("div", "ev_privacy_text_bottom", null);
        ni.innerText = "本服务由小冰公司运营";
        p.appendChild(ni);
        e.appendChild(k);
        ui = sj_ce("span", a, "ev_talkbox");
        ui.appendChild(gt);
        nt.appendChild(pt);
        nt.appendChild(vi);
        nt.appendChild(tu);
        e.appendChild(nt);
        y.appendChild(ui);
        y.appendChild(p);
        y.appendChild(it);
        e.appendChild(y);
        e.appendChild(v);
        i.appendChild(f);
        t == o ? (ct = !0,
        f.style.cssText = ";background-image: url(" + n.BlinkEyeEntryUrl + "); width: 75px",
        i.className = "ev_talkbox_cn_min",
        f.className = typeof _ge("ent-car-exp") != "undefined" && _ge("ent-car-exp") !== null ? "ev_min_cn_img_casol" : "ev_min_cn_img",
        typeof _ge("tob_container") != "undefined" && _ge("tob_container") !== null && (MsnShared.addClass(u, "ev_talkbox_wrapper_mintob"),
        si = !0)) : (f.style.cssText = ";background-image: url(" + n.VirtualCharacterEntryUrl + ")",
        i.className = "ev_talkbox_virtual_min",
        f.className = "ev_min_virtual_img");
        var g = sj_ce("div", "ev_hook_header", "ev_hook_header")
          , rr = sj_ce("div", "ev_hook_header_img", "ev_hook_header_img")
          , ai = sj_ce("div", "ev_hook_header_isRead", "ev_hook_header_isRead")
          , fi = sj_ce("div", "ev_hook_header_text", "ev_hook_header_text")
          , yi = sj_ce("div", "ev_hook_header_text_title", "ev_hook_header_text_title")
          , bi = sj_ce("div", "ev_hook_header_text_reply", "ev_hook_header_text_reply");
        yi.innerText = ht;
        bi.innerText = ru;
        ai.innerText = "1";
        var fr = sj_ce("div", "ev_hook_header_close", "ev_hook_header_close")
          , ki = sj_ce("div", "ev_hook_send", "ev_hook_send")
          , gi = sj_ce("div", "ev_hook_send_input", "ev_hook_send_input")
          , nr = sj_ce("div", "ev_hook_send_input_placeholder", "ev_hook_send_input_placeholder");
        nr.innerText = "回复小冰";
        gi.appendChild(nr);
        fi.appendChild(yi);
        fi.appendChild(bi);
        g.appendChild(rr);
        g.appendChild(ai);
        g.appendChild(fi);
        g.appendChild(fr);
        ki.appendChild(gi);
        et.appendChild(g);
        et.appendChild(ki);
        u.appendChild(et);
        u.appendChild(e);
        u.appendChild(i);
        typeof _ge("sbBoxCnt") != "undefined" && _ge("sbBoxCnt") !== null && (di = !0,
        l.setAttribute("data-priority", "2"),
        l.src = n.EntranceAnimationUrl,
        _ge("sbBoxCnt").appendChild(l),
        tr = MsnShared.getElementsByClassName("b_unarfo", "div", _ge("uaanswer")),
        ir = du(tr[0].innerText, '12px/1.6 "Microsoft Yahei"'),
        l.style.left = ir + "px",
        wr(),
        su = !0)
    }
    function du(n, t) {
        var u = document.createElement("canvas"), i = u.getContext("2d"), r;
        return i.font = t || "12px",
        r = i.measureText(n),
        r.width
    }
    function wr() {
        navigator.userAgent.toLowerCase().indexOf("trident") > -1 && (l.style.top = "-14px")
    }
    function gu() {
        w.className && w.className != "ev_tb_headerselect_open" ? (w.className = "ev_tb_headerselect_open",
        k.className = "ev_tb_header_dropdown_open",
        c.className == "ev_tb_disable_setting" && (c.className = "b_hide"),
        s.className = "b_hide",
        ft.className = "b_hide") : (w.className = "ev_tb_header_select_close",
        k.className = "ev_tb_header_dropdown_close")
    }
    function nf() {
        sj_be(w, "click", function() {
            gu()
        });
        sj_be(_ge("ev_talkbox_wrapper"), "click", function(n) {
            n.target.className == "ev_tb_disable" ? c.className == "b_hide" && s.className == "b_hide" ? (c.className = "ev_tb_disable_setting",
            w.className == "ev_tb_headerselect_open" && (w.className = "ev_tb_header_select_close",
            k.className = "ev_tb_header_dropdown_close")) : s.className == "ev_disable_popup_setting" ? (s.className = "b_hide",
            ft.className = "b_hide") : c.className = "b_hide" : n.target.className == "ev_tb_disable_setting" ? s.className == "b_hide" ? (c.className = "b_hide",
            s.className = "ev_disable_popup_setting",
            ft.className = "ev_disable_popup_background") : (s.className = "b_hide",
            ft.className = "b_hide") : c.className == "ev_tb_disable_setting" && (c.className = "b_hide")
        });
        sj_be(_ge("ev_disable_popup_setting_btn1"), "click", function() {
            hi("##Disable##", "disablechat")
        });
        sj_be(_ge("ev_disable_popup_setting_btn2"), "click", function() {
            s.className = "b_hide";
            ft.className = "b_hide"
        });
        sj_be(y, "click", function() {
            c.className == "ev_tb_disable_setting" && (c.className = "b_hide")
        });
        sj_be(_ge("uaseabox"), "click", function() {
            dr();
            di = !1;
            ci(l, n.OverEyeAnimationUrl);
            bt = !0;
            l.style.top = "-51px";
            sb_st(function() {
                bt && (ci(l, n.OverEyeStaticAnimationUrl),
                gi = !0,
                bt = !1)
            }, 8e3)
        });
        sj_be(_d, "mouseup", function(t) {
            t.target.id != "uaseabox" && (wr(),
            (bt || gi) && (bt = !1,
            gi = !1,
            ci(l, n.LooseHandAnimationUrl)))
        });
        sj_be(l, "click", function() {
            p() && Log.Log("DHTMLClick", h, "clickSBA", !1)
        });
        sj_be(l, "mouseover", function() {
            p() && Log.Log("DHTMLClick", h, "focusSBA", !1)
        });
        sj_be(nt, "click", function(n) {
            n.target.className != "ev_enlarge_img" && MsnShared.hide(nt)
        });
        sj_be(vi, "click", function() {
            MsnShared.hide(nt)
        })
    }
    function br() {
        var t = yi + 91;
        pt.style.width = "348px";
        var s = 348 * r.height / r.width
          , i = 348
          , n = 479
          , f = 0
          , u = 0
          , e = 10
          , o = 10;
        r.width / r.height > .83 ? t < 479 ? s > t ? (i = t * r.width / r.height,
        n = t,
        f = (348 - i) / 2,
        o = f + 10) : (n = 348 * r.height / r.width,
        u = (t - n) / 2,
        e = u + 10) : (n = 348 * r.height / r.width,
        u = (479 - n) / 2,
        e = u + 10) : (t < 479 ? (n = t,
        i = t * r.width / r.height) : i = 479 * r.width / r.height,
        i > 348 ? (i = 348,
        n = 348 * r.height / r.width,
        u = (479 - n) / 2,
        e = u + 10) : f = (348 - i) / 2);
        pt.style.cssText = ";height: " + n + "px; width: " + i + "px; margin-top: " + u + "px; margin-left: " + f + "px";
        vi.style.cssText = ";top: " + e + "px; right: " + o + "px"
    }
    function ci(n, t) {
        var i = new Image;
        i.src = t;
        i.complete ? n.src = t : i.onload = function() {
            n.src = t
        }
    }
    function tf() {
        sb_st(function() {
            di && ci(l, n.StaticAnimationUrl)
        }, 8e3)
    }
    function rf() {
        MsnShared.hide(_ge("ev_talkbox_wrapper"))
    }
    function uf() {
        sj_be(d, "click", function() {
            ir(o)
        });
        sj_be(ot, "click", function() {
            ir(yt)
        });
        sj_be(st, "click", function() {
            ir(ri)
        })
    }
    function ir(i) {
        t = i;
        d.className = "ev_tb_header_dropdown_button_ice";
        ot.className = "ev_tb_header_dropdown_button_boy";
        st.className = "ev_tb_header_dropdown_button_girl";
        w.className = "ev_tb_header_select_close";
        k.className = "ev_tb_header_dropdown_close";
        p() && Log.Log("DHTMLClick", h, "selectBotType", !1, "botType", t);
        i == o ? (d.className = g,
        b.innerHTML = ht,
        MsnShared.show(y),
        MsnShared.hide(v)) : (n.iframeTalkStatus && navigator.cookieEnabled ? (f.style.cssText = ";background-image: url(" + n.VirtualCharacterEntryUrl + ")",
        i == yt ? (ot.className = g,
        b.innerHTML = pi,
        v.src = n.IsDarkMode ? ui + "?webthemedark=1" : ui) : i == ri && (st.className = g,
        b.innerHTML = wi,
        v.src = n.IsDarkMode ? fi + "?webthemedark=1" : fi),
        MsnShared.show(v),
        MsnShared.hide(y)) : (MsnShared.show(y),
        sf(),
        MsnShared.hide(v),
        d.className = g,
        b.innerHTML = ht,
        t = o),
        tr(li));
        sj_cook.set(vt, ii, t)
    }
    function ff() {
        sj_be(et, "click", function(n) {
            n.target.className != "ev_hook_header_close" && (MsnShared.show(e),
            _ge(ti).focus(),
            MsnShared.hide(et),
            MsnShared.hide(i))
        })
    }
    function ef() {
        sj_be(_ge("ev_hook_header_close"), "click", function() {
            ki = !0;
            sj_cook.get(sr) ? sj_cook.setNoCrumbs(ai, "TRUE", !0, "/", 10080) : sj_cook.setNoCrumbs(ai, "TRUE", !0, "/", 20160);
            MsnShared.removeClass(u, "ev_talkbox_wrapper");
            MsnShared.addClass(u, "ev_talkbox_wrapper_min");
            si && MsnShared.addClass(u, "ev_talkbox_wrapper_mintob");
            ni();
            MsnShared.show(i);
            MsnShared.hide(et);
            MsnShared.hide(e)
        })
    }
    function ni() {
        sb_ct(gt);
        sb_ct(dt);
        sb_ct(lt);
        ct = !0;
        at(n.BlinkEyeEntryUrl);
        dt = sb_st(function() {
            ct = !1;
            at(n.CloseEyeEntryUrl);
            lt = sb_st(function() {
                at(n.KeepSleepEntryUrl)
            }, 5e3)
        }, 1e4)
    }
    function sf() {
        var t = it(iu, !0, !1, "", "1")
          , n = _ge(a);
        n.appendChild(t);
        n.scrollTop = n.scrollHeight
    }
    function rr(n, t) {
        pr();
        var i = it(n, !0, !1, "", t);
        sb_st(function() {
            ut = 1;
            nr();
            var n = _ge(a);
            n.appendChild(i);
            n.scrollTop = n.scrollHeight
        }, 1500)
    }
    function hf() {
        var u = !1, f, r;
        i.onmousedown = function(n) {
            f = n.clientY - i.offsetTop;
            _ge("ev_hook").className == "b_hide" && (u = !0)
        }
        ;
        _d.onmousemove = function(n) {
            var t, e, o, s;
            if (u)
                r = n.clientY - f,
                o = ((t = _d.documentElement) === null || t === void 0 ? void 0 : t.clientHeight) || ((e = _d.body) === null || e === void 0 ? void 0 : e.clientHeight),
                s = o - i.offsetHeight,
                r = Math.min(s, Math.max(0, r)),
                i.style.top = r + "px",
                ei = !0;
            else
                return
        }
        ;
        _d.onmouseup = function() {
            u = !1;
            ei && p() && Log.Log("DHTMLClick", h, "moveIcon", !1, "currentTop", r + "px")
        }
        ;
        sj_be(i, "mouseover", function() {
            t != o || kt || (sb_ct(gt),
            sb_ct(dt),
            sb_ct(lt),
            at(n.BlinkEyeEntryUrl))
        });
        sj_be(i, "mouseout", function() {
            t != o || kt || ni()
        });
        sj_be(_ge("sb_form_q"), "click", function() {
            dr()
        })
    }
    function at(n) {
        var t = new Image;
        t.src = n;
        t.complete ? f.style.cssText = ";background-image: url(" + n + "); width: 75px" : t.onload = function() {
            f.style.cssText = ";background-image: url(" + n + "); width: 75px"
        }
    }
    function dr() {
        ct && (sb_ct(gt),
        sb_ct(dt),
        sb_ct(lt),
        ct = !1,
        at(n.CloseEyeEntryUrl),
        lt = sb_st(function() {
            at(n.KeepSleepEntryUrl)
        }, 5e3))
    }
    function lf() {
        var n = getComputedStyle(_ge("ev_hook_send")).backgroundColor != "rgb(255, 255, 255)";
        return bi = n ? !0 : !1
    }
    function af(n) {
        var t = !1, i;
        try {
            i = JSON.parse(n)
        } catch (r) {
            return p() && Log.Log("JsonParseError", h, "getZoChatJsonParse", !1),
            !1
        }
        return t = !0,
        vu("我已经开始升级啦，期待一下吧！", ""),
        t
    }
    var u = _ge("ev_talkbox_wrapper"), a = "ev_talkbox", ur = "ev_send_button", ti = "ev_send_text", n, fr = "", gr = "", ut = 0, er = "ZHSEARCHCHATSTATUS", nu = "STATUS", li = "1", or = "0", h = "ChineseChatBot", sr = "ZHLASTACTIVECHAT", ai = "HOOKBLOCKINDICATOR", vt = "ZHSEARCHCHATCHARACTER", ii = "CHARACTER", o = "0", hr = "ZHCHATSTRONGATTRACT", cr = "ZHCHATWEAKATTRACT", yt = "1", ri = "2", t = "0", e = sj_ce("div", "ev_talkbox_max", "b_hide"), et = sj_ce("div", "ev_hook", "b_hide"), i = sj_ce("div", "ev_talkbox_min", null), k = sj_ce("div", "ev_tb_header_dropdown", "ev_tb_header_dropdown_close"), d = sj_ce("button", "ev_tb_header_dropdown_button_ice", "ev_tb_header_dropdown_button_ice"), ot = sj_ce("button", "ev_tb_header_dropdown_button_boy", "ev_tb_header_dropdown_button_boy"), st = sj_ce("button", "ev_tb_header_dropdown_button_girl", "ev_tb_header_dropdown_button_girl"), g = "ev_tb_header_dropdown_button_select", w = sj_ce("span", "ev_tb_header_select_img", "ev_tb_header_select_close"), b = sj_ce("a", "ev_tb_header_default_text", "ev_tb_header_default_text"), c = sj_ce("div", "ev_tb_disable_setting", "b_hide"), s = sj_ce("div", "ev_disable_popup_setting", "b_hide"), ft = sj_ce("div", "ev_disable_popup_background", "b_hide"), l = sj_ce("img", "ev_search_bar_animation", ""), nt = sj_ce("div", "ev_show_enlarge_img", "b_hide"), pt = sj_ce("img", "ev_enlarge_img", "ev_enlarge_img"), vi = sj_ce("div", "ev_enlarge_close", "ev_enlarge_close"), tu = sj_ce("div", "ev_enlarge_background", "ev_enlarge_background"), r = new Image, tt, yi, ht = "小冰", pi = "虚拟男友", wi = "虚拟女友", v = sj_ce("iframe", "ev_iframe_talk", "b_hide"), y = sj_ce("div", "ev_default_talk", null), f = sj_ce("span", "ev_min_zo_img", null), ui = "https://ux-plus-bing.xiaoice.com/BingVirtualBF", fi = "https://ux-plus-bing.xiaoice.com/BingVirtualGF", iu = "在【旧版本浏览器】和【阻止第三方Cookie】的设置下不支持召唤虚拟伴侣, 请尝试切换到新版Edge进行体验或打开允许站点读取cookie的相关设置", ru = "快来定制你的专属虚拟伴侣吧！ ", wt = !1, lr, uu = !1, bi = !1, fu = "", eu = "", ou = "", ki = !1, su = !1, di = !1, gi = !1, bt = !1, ei = !1, kt = !1, ct = !1, dt, lt, gt, oi = "", ar = "HOOKPOPUPCLICK", si = !1, cf = /^[\u4E00-\u9FA5]{2}座$/;
    hu()
}
)(ChineseChat_XiaoIceApi || (ChineseChat_XiaoIceApi = {}))
