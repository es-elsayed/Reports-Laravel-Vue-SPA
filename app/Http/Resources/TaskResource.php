<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TaskResource extends JsonResource
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
            'title' => $this->title,
            'project_name' => $this->project_name,
            'role' => $this->role,
            'report_id' => $this->report_id,
            'who_is_assign' => $this->who_is_assign,
            'current_date' => $this->current_date,
            'hours' => $this->hours,
            'minutes' => $this->minutes,
            'user_id' => $this->user_id,
        ];
    }
}
