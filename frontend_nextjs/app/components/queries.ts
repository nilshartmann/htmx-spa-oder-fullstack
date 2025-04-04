import {
  NewFeedback,
  PageResponseRecipeDto,
} from "@/app/components/api-types.ts";
import {
  fetchFromApi,
  fetchNullableFromApi,
  getEndpointConfig,
} from "@/app/components/fetch-from-api.ts";
import {
  recipesPerPage,
  slowDown_AddFeedback,
  slowDown_GetFeedbacks,
  slowDown_GetRecipe,
  slowDown_GetRecipeList,
  slowDown_IncreaseLikes,
} from "@/app/demo-config.tsx";

export function fetchRecipes(
  page: number = 0,
  orderBy?: "time" | "likes",
  ids?: string[],
): Promise<PageResponseRecipeDto> {
  const idsString = ids?.join(",");
  const result = fetchFromApi(
    getEndpointConfig("get", "/api/recipes"),
    {
      query: {
        page,
        size: recipesPerPage,
        sort: orderBy,
        ids: idsString,
        slowdown: slowDown_GetRecipeList,
        // @ts-ignore
        timer: Date.now(),
      },
    },
    ["recipes"],
  );

  return result;
}

export function fetchRecipe(recipeId: string) {
  return fetchNullableFromApi(
    getEndpointConfig("get", "/api/recipes/{recipeId}"),
    {
      path: {
        recipeId,
      },
      query: {
        slowdown: slowDown_GetRecipe,
      },
    },
    [`recipes/${recipeId}`],
  );
}

export function fetchFeedback(recipeId: string, feedbackPage: number = 0) {
  return fetchFromApi(
    getEndpointConfig("get", "/api/recipes/{recipeId}/feedback"),
    {
      path: {
        recipeId,
      },
      query: {
        slowdown: slowDown_GetFeedbacks,
        page: feedbackPage,
      },
    },
  );
}

export function saveFeedback(recipeId: string, newFeedback: NewFeedback) {
  return fetchFromApi(
    getEndpointConfig("post", "/api/recipes/{recipeId}/feedbacks"),
    {
      path: { recipeId },
      body: { feedbackData: newFeedback },
      query: {
        slowdown: slowDown_AddFeedback,
      },
    },
  );
}

export function saveLikeToDb(recipeId: string) {
  return fetchFromApi(
    getEndpointConfig("patch", "/api/recipes/{recipeId}/likes"),
    {
      path: {
        recipeId,
      },
      query: {
        slowdown: slowDown_IncreaseLikes,
      },
    },
  );
}
