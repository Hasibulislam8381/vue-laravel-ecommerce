<?php

use App\Http\Controllers\Admin\AppointmentController;
use App\Http\Controllers\Admin\AppointmentStatusController;
use App\Http\Controllers\Admin\ClientController;
use App\Http\Controllers\Admin\DashboardStatController;
use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\ApplicationController;
use Illuminate\Support\Facades\Route;






/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
// Route::get('/admin/dashboard', function () {
//     return view('dashboard');
// });

Route::middleware('auth')->group(function(){
Route::get('/api/status/appointments',[DashboardStatController::class,'appointments']);
Route::get('/api/status/users',[DashboardStatController::class,'users']);
    Route::get('/api/users',[UserController::class,'index']);
Route::post('/api/users',[UserController::class,'store']);


Route::patch('/api/users/{user}/change-role',[UserController::class,'changeRole']);
Route::put('/api/users/{user}',[UserController::class,'update']);
Route::delete('/api/users/{user}', [UserController::class, 'destroy']);
Route::delete('/api/users', [UserController::class, 'bulkDelete']);

Route::get('/api/appointments',[AppointmentController::class,'index']);

Route::get('/api/appointment-status',[AppointmentStatusController::class,'getStatusWithCount']);
Route::post('/api/appointments/create',[AppointmentStatusController::class,'store']);
Route::get('/api/appointments/{appointment}/edit',[AppointmentStatusController::class,'edit']);
Route::put('/api/appointments/{appointment}/edit',[AppointmentStatusController::class,'update']);
Route::delete('/api/appointments/{appointment}',[AppointmentStatusController::class,'destroy']);

Route::get('/api/settings',[SettingController::class,'index']);
Route::post('/api/settings',[SettingController::class,'update']);

// Client controller route
Route::get('/api/client',[ClientController::class,'index']);
Route::get('/api/profile',[ProfileController::class,'index']);
Route::put('/api/profile',[ProfileController::class,'update']);
Route::post('/api/upload-profile-image',[ProfileController::class,'uploadImage']);
Route::post('/api/change-user-password',[ProfileController::class,'changePassword']);

});



// 

Route::get('{view}',ApplicationController::class)->where('view',('.*'))->middleware('auth');

