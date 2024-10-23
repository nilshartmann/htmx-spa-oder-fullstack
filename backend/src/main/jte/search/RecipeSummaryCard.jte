@import nh.recipify.domain.web.CssClassNameUtil

@param nh.recipify.domain.api.RecipeDto recipe
@param gg.jte.Content summary = null

<div
        id="recipe_${recipe.id()}"
        class="transform rounded border border-gray-200 bg-white p-4 shadow-lg transition-all duration-500 ease-in-out hover:drop-shadow-2xl"
>
    <div class="flex justify-between space-x-2">
        <div class="flex w-2/3 flex-col justify-between">
            <div class="space-y-2">
                <p
                        class="font-space text-sm font-medium uppercase tracking-[2px] text-red"
                >
                    ${recipe.mealType()}
                </p>
                <h2 class="font-space text-2xl font-bold">
                    <a
                            class="cursor-pointer hover:text-orange_2 hover:underline"

<%--                            "normaler" Link--%>
                            href="/recipes/${recipe.id()}"
                            hx-get="/recipes/${recipe.id()}"
                            hx-push-url="/recipes/${recipe.id()}"


                            <%--🤔 warum select="main"? --%>
                            <%--🕵️‍♀️ Netzwerkverkehr --%>
                            <%--🤔 Welche Alternative gäbe es dazu? --%>
                            hx-select="main"
                            hx-target="main"
                            hx-swap="outerHTML"



                            <%--SCHRITT 1: Link "SPA-fähig" machen                             --%>
                            <%--                            sw1  --%>

                            <%--SCHRITT 2: Korrektes Ziel setzen --%>
                            <%--                            sw2  --%>
                    >
                       ${recipe.title()}
                    </a>
                </h2>
            </div>
            <div>
                <i
                        hx-get="/search/${recipe.id()}/summary?include_details=${summary==null}"
                        hx-target="#recipe_${recipe.id()}"
                        hx-swap="outerHTML"
                        class="${CssClassNameUtil.cssClassName(
                            "fa-solid cursor-pointer text-orange",
                            summary!=null ? "fa-angles-up" : "fa-angles-down")}"

                ></i>
            </div>
        </div>
        <div class="w-1/3">
            <div class="overflow-hidden">
                <img
                        class="mb-2 h-24 max-h-full w-full max-w-full transform rounded object-cover transition-all duration-500 ease-in-out hover:scale-110"
                        src="/images/recipes/food_${recipe.id()}.png"
                />
            </div>
        </div>
    </div>
    ${summary}
    <%--        <th:block th:if="${summary != null}">--%>
    <%--            <th:block th:replace="${summary}"></th:block--%>
    <%--            ></th:block>--%>
</div>