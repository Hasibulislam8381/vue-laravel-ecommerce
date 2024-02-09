<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;

class UserController extends Controller
{
    //
    public function index(){
       $users= User::latest()->paginate(10);
       return $users;


    }
    public function store(){
     request()->validate([
    'name'=>'required',
    'email'=> 'required|unique:users,email',
    'password'=>'required|min:8',
]);

      return User::create([
        'name'=>request('name'),
        'email'=>request('email'),
        'password'=> bcrypt(request('password')),
      ]);

    }
    public function update(User $user){

        request()->validate([
            'name'=>'required',
            'email'=>'required|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:8',
        ]);
        $user->update([
            'name'=>request('name'),
            'email'=>request('email'),
            'password'=>request('password')?bcrypt(request('password')):$user->password,
        ]);
        return $user;
    }
    public function destroy(User $user){
        $user->delete();
        return response()->noContent();
    }
    public function changeRole(User $user){
      $user->update([
        'role'=>request('role'),
      ]);

      return response()->json(['success'=>true]);
    }
    public function search(){
        $seachQuery = request('query');

        $users = User::where('name','like',"%{$seachQuery}%")->paginate(10);

        return response()->json($users);
    }
    public function bulkDelete(){
    
        User::whereIn("id",request("ids"))->delete();
        return response()->json(['message'=>'Users Deleted Successfully']);
   
   
    }


}
