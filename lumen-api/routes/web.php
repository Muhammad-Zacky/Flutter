<?php

/** @var \Laravel\Lumen\Routing\Router $router */

$router->get('/', function () use ($router) {
    return $router->app->version();
});

// Letakkan DI LUAR route '/'
$router->group(['prefix' => 'api/tokobuku'], function () use ($router) {
    $router->get('/', 'KampusController@index');         // GET all
    $router->get('{id}', 'KampusController@show');       // GET by ID
    $router->post('/', 'KampusController@store');        // POST create
    $router->put('{id}', 'KampusController@update');     // PUT update
    $router->delete('{id}', 'KampusController@destroy'); // DELETE
});
