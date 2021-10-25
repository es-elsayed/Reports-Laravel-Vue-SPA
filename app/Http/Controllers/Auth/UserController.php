<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Get authenticated user.
     */
    public function index(Request $request)
    {
        return User::all();
    }
    public function current(Request $request)
    {
        return response()->json($request->user());
    }
}
