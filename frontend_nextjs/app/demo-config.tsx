// initial Demo Konfiguration::::::::::

export const enableSuspenseForFeedback = true;
export const slowDown_IncreaseLikes = 3600;
export const slowDown_GetFeedbacks = 3000;
export const slowDown_GetRecipe = 2000;
export const showNextLogoInHeader = false;
// //////////////////////////////////////////////////////

export const enableTanstackQueryDevTools = false;

/**
 * Set to -1 to make searching for longer terms FASTER
 * than searching for shorter terms
 * to show discarding of older requests
 */
export const slowDown_search = 1200;

/** number of recipes on /recipes */
export const recipesPerPage = 6;

/** slowdown reading of /recipes */
export const slowDown_GetRecipeList = 0;

/** delay after submitting the add feedback form */
export const slowDown_AddFeedback = 0;

/** delay after submitting the newsletter form
 * note that there is a default delay of 250ms in the server
 * */
export const slowDown_SubscribeNewsletter = 2500;
