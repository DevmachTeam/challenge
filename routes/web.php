<?php

use App\Http\Controllers\TncController;
use Illuminate\Support\Facades\Route;


Route::get('/', [TncController::class,'index']);

