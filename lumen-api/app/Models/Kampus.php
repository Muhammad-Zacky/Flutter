<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kampus extends Model
{
    protected $table = 'kampuss';
    protected $primaryKey = 'id';
    public $incrementing = true;
    protected $fillable = [
        'name', 'alamat', 'no_telepon', 'category', 'lat', 'lng'
    ];
}
