<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'project_id',
        'report_id',
        'who_is_assign',
        'description',
        'hours',
        'minutes',
        'user_id',
    ];
    // protected $hidden = [
    //     'created_at',
    //     'updated_at',
    // ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function project()
    {
        return $this->belongsTo(Project::class);
    }
}
