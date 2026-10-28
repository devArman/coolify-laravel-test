<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/health', fn () => response()->json([
    'app' => config('app.name'),
    'env' => app()->environment(),
    'laravel' => app()->version(),
    'php' => PHP_VERSION,
    'time' => now()->toIso8601String(),
]));
