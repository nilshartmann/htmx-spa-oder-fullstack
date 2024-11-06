// initial Demo Konfiguration::::::::::

// Für 2. Demo auf true setzen:
export const enableSuspenseForFeedback = true;

export const slowDown_IncreaseLikes = 1200;
export const slowDown_GetFeedbacks = 1600;
export const slowDown_GetRecipe = 0;
export const showNextLogoInHeader = false;

// Für Request-Demo auf 0 setzen:
export const debounce_search = 0;

export const slowDown_search = 1200;

// //////////////////////////////////////////////////////
export const enableTanstackQueryDevTools = false;

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
