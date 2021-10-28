<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Resources\UserResource;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Get authenticated user.
     */
    public function index(Request $request)
    {
        return UserResource::collection(User::all());
        return User::whereMonth('created_at', Carbon::now()->month)->get();
    }
    public function current(Request $request)
    {
        return response()->json($request->user());
    }
    public function show($id)
    {
        return response(new UserResource(User::findOrFail($id)));
    }
}
