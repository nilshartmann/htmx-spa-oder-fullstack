@param String recipeId
<div class="border-1 mt-8 w-full rounded-2xl bg-goldgray p-8 md:mt-0">
    <h2 class="mb-4 font-space text-3xl font-bold">Feedback</h2>
    <div
            id="feedbackList"

            <%--            SCHRITT 1: Automatisch laden --%>
            <%--            fl1                          --%>

    >
    </div>

    <div id="feedbackListIndicator"
         class="Spinner"
    >
        @template.recipe.feedback.FeedbackLoadingIndicator()
    </div>
</div>