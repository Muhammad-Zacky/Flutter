<?php

namespace App\Http\Controllers;

use Laravel\Lumen\Routing\Controller as BaseController;
use Illuminate\Http\JsonResponse;

class UserController extends BaseController
{
    public function index(): JsonResponse
    {
        return response()->json([
            'user' => [
                ['id' => 1, 'name' => 'Zacky'],
                ['id' => 2, 'name' => 'Arya'],
                ['id' => 3, 'name' => 'ASep'],
                ['id' => 4, 'name' => 'Samsul'],
                ['id' => 5, 'name' => 'Rohi'],
                ['id' => 6, 'name' => 'Haha']
            ]
        ]);
    }
}
