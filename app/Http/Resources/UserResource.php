<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'role' => $this->role,
            'job' => $this->job,
            'image' => $this->image,
            // 'tasks_hours' => ($this->currentMonthTasks)
            'month_hours' => (int)($this->currentMonthTasks->sum('hours') + $this->currentMonthTasks->sum('minutes')/60),
            'month_minutes' => $this->currentMonthTasks->sum('minutes')%60,
            'today_hours' => (int)($this->currentDayTasks->sum('hours') + $this->currentDayTasks->sum('minutes')/60),
            'today_minutes' => $this->currentDayTasks->sum('minutes')%60,
        ];
    }
}
