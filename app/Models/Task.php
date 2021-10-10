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
        'report_id',
        'who_is_assign',
        'description',
        'difficulties',
        'hours',
        'minutes',
        'user_id',
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
