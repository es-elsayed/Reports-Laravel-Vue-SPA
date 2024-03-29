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
            'project_name' => $this->project->name,
            'report_id' => $this->report_id,
            'date' => $this->created_at,
            'role' => $this->user->role,
            'user_name' => $this->user->name,
            'who_is_assign' => $this->user->name,
            'description' => $this->description,
            'difficulties' => $this->difficulties,
            'hours' => $this->hours,
            'minutes' => $this->minutes,
            'user_id' => $this->user_id,
        ];
    }
}
