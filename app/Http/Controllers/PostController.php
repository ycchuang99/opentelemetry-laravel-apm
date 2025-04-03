<?php

namespace App\Http\Controllers;

use App\Models\Post;

class PostController extends Controller
{
    public function index()
    {
        return response()->json(Post::all());
    }

    public function show(Post $id)
    {
        return response()->json(Post::findOrFail($id));
    }
}
