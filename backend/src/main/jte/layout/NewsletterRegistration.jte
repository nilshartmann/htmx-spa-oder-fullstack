@param String newsletterEmail = ""
@param String newsletterResult = ""

<form
        class="max-w-1/4 flex items-center space-x-4 pe-2 ps-2 font-barlow"
        <%--        SCHRITT 1: Formular posten        --%>
        <%--        🕵️‍♀️ Formular-Struktur zeigen       --%>
        <%--         - 🔎 Netzwerkverkehr untersuchen --%>
        <%--        na1                               --%>
        hx-post="/newsletter?slowdown=2400"
                hx-swap="outerHTML"

        <%--        SCHRITT 2: Formular disablen     --%>
        <%--        ?slowdown=2400                   --%>
        <%--        na2                              --%>
        hx-disabled-elt="this, input, button"
        <%--        SCHRITT 3: Loading Indicator     --%>
        <%--        🕵️‍♀️ div unten                     --%>
        <%--        na3                              --%>
        hx-indicator="#newsletterLoading"

        <%--        SCHRITT 4: Zurücksetzen          --%>
        <%--        🤔 wie setzen wir das Formular zurück  --%>

>
    <label for="newsletterEmailInput">Don't miss new recipes. Subscribe to newsletter</label>
    <div class="max-w-64">
        <input
                id="newsletterEmailInput"
                name="newsletterEmail"
                type="text"
                class="h-8 w-full max-w-full rounded border border-gray-400 bg-white p-2 text-gray-500 disabled:bg-gray-200"
                value="${newsletterEmail}"
                placeholder="E-Mail"
        />
    </div>
    <div>
        @template.components.Button(
        checked="success".equals(newsletterResult),
        disabled=false,
        content = @`
            <div class="flex space-x-2">
                <button
                        id="subscribeButton"
                        type="submit"
                >Subscribe

                </button>
                @template.components.LoadingIndicator(
                id = "newsletterLoading",
                secondary = true
                )
            </div>
        `)
    </div>
    @if("success".equals(newsletterResult))
        <div>Subscribed!</div>
    @endif

</form>
