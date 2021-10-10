<?php

namespace App\Console\Commands;

use App\Models\Report;
use Carbon\Carbon;
use Illuminate\Console\Command;

class Reportdaily extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'report:add';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Add report every day';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $currentDay = Carbon::now()->format('l');
        $currentDate = Carbon::now()->format('( d / m / Y )');

        if (
            $currentDay == 'Sunday' ||
            $currentDay == 'Monday' ||
            $currentDay == 'Tuesday' ||
            $currentDay == 'Wednesday' ||
            $currentDay == 'Thursday'
        ) {
            $oldReports = Report::all();
            foreach ($oldReports as $oldReport) {
                $oldReport->update(['status' => '0']);
            }
            $report = Report::create([
                'title' => $currentDay . ' Report ' . $currentDate,
                'status' => '1'
            ]);
        } else {
            return;
        }
    }
}
