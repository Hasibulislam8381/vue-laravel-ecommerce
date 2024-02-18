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
      
      $validated = request()->validate([
        'client_id'=>'required',
        'title' => 'required',
        'description' => 'required',
        'start_time' => 'required',
        'end_time' => 'required',
    ],

    [
      'client_id.required'=>'Client name field is Required!'
    ]
  );
    

        Appointment::create([
          'title'=>$validated['title'],
          'client_id'=>$validated['client_id'],
          'start_time'=>$validated['start_time'],
          'end_time'=>$validated['end_time'],
          'description'=>$validated['description'],
          'status'=>AppointmentStatus::SCHEDULED
        ]);

        return response()->json(['message'=>'success']);
    }
}
