<?php

use App\Models\Setting;


function setting($key) {

    $settings = Cache::rememberForever('settings',function(){
     return Setting::pluck('value', 'key')->all();
    });

    if(!$settings){
        $settings = config('settings.default');
    }
    
     return $settings[$key] ?? null;
  
}


?>