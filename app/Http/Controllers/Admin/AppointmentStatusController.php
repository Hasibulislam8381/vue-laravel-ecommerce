<?php

namespace App\Http\Controllers\Admin;

use App\Enums\AppointmentStatus;
use App\Models\Appointment;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AppointmentStatusController extends Controller
{
    //

    public function getStatusWithCount(){

         $cases = AppointmentStatus::cases();
       return  collect($cases)->map(function($status){
            return[
                "name"=>$status->name,
                "value"=>$status->value,
                "count"=>Appointment::where('status',$status->value)->count(),
                "color"=>AppointmentStatus::from($status->value)->color(),
            ];
         });



    }

    public function  store(){
      
      request()->validate([
        'title'=>'required',
        'description'=>'required'
      ]);

        Appointment::create([
          'title'=>request('title'),
          'client_id'=>1,
          'start_time'=>now(),
          'end_time'=>now(),
          'description'=>request('description'),
          'status'=>AppointmentStatus::SCHEDULED
        ]);

        return response()->json(['message'=>'success']);
    }
}
