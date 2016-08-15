<?php

namespace FGO;

use Illuminate\Foundation\Auth\User as Authenticatable;
use OwenIt\Auditing\AuditingTrait;

class User extends Authenticatable
{
	use AuditingTrait;
	
    // Disables the log record in this model.
    protected $auditEnabled  = true;

    // Clear the oldest records after 100 records.
    protected $historyLimit = 100; 

    // Fields that you do NOT want to register.
    protected $dontKeepLogOf = ['created_at', 'updated_at'];

    // Tell what actions you want to audit.
    protected $auditableTypes = ['created', 'saved', 'deleted'];
	
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];
}
