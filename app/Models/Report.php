<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Report extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'title',
        'status',
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
