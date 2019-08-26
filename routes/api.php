<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
  return $request->user();
});


Route::group(['middleware' => ['apikey'], 'namespace' => 'API'], function () {
  Route::group(['prefix' => 'v2'], function () {
    Route::get('menus/{id?}', 'MenusController@getMenus');
    Route::get('posts', 'PostsController@getPosts');
    Route::post('postcomments', 'CommentController@postComments');
    Route::get('getcomments', 'CommentController@getComments');
    Route::get('directory/{id}/filter', 'ArchiveController@getArchive');
    Route::get('customizer', 'CustomizerController@get');
    Route::get('posts/detail/{id}', 'PostsController@detailsPost');
    Route::get('pages/{id}', 'PagesController@getPages');
    

    // slide
    Route::get('slideshow', 'SlideController@GetSlide');
    Route::get('maps', 'MapsController@getMaps');


  });
});
