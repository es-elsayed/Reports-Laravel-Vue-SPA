<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'project_name',
        'role',
        'report_id',
        'who_is_assign',
        'description',
        'current_date',
        'difficulties',
        'hours',
        'minutes',
        'user_id',
        'updated_at',

    ];
    // protected $hidden = [
    //     'created_at',
    //     'updated_at',
    // ];
    // public function user()
    // {
    //     return $this->belongsTo(User::class);
    // }
}
