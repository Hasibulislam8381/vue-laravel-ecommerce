<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Appointment;

class AppointmentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Appointment::create([
            'client_id' => 1, // Replace with an existing client's ID or use Client::factory()->create()->id
            'title' => 'Meeting 1',
            'description' => 'Discuss project details',
            'start_time' => now(),
            'end_time' => now()->addHours(2),
            'status' => 1,
        ]);
        // Use the factory to create dummy appointments
        Appointment::factory(10)->create();
    }
}
