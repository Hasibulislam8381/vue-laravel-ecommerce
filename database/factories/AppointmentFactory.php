<?php

namespace Database\Factories;

use App\Models\Appointment;
use App\Models\Client;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Carbon;

class AppointmentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition(): array
    {
        $startTime = $this->faker->dateTimeBetween('-1 Year', '+1 Year');

        return [
            'client_id' => Client::factory(),
            'title' => $this->faker->sentence(),
            'description' => $this->faker->paragraph(),
            'start_time' => $startTime,
            'end_time' => Carbon::parse($startTime)->addHours(2),
            'status' => $this->faker->randomElement([1, 2, 3]),
        ];
    }
}
