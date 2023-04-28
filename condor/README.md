## TODOs before submission

1. To pack your codes

```sh
conda activate base
conda pack -n resize
chmod 644 resize.tar.gz
tar -zcvf resize_videos.tar.gz ../resize_videos.py ../check_videos.py
```

2. To move those to the staging directory:

```
mv resize.tar.gz  /staging/whuang288/
mv resize_videos.tar.gz /staging/groups/li_group_biostats
```

3. Submit the job

`condor_submit resize.sub`

## Other Useful Condor commands

- To submit interactive job for debugging: `condor_submit -i resize.sub`

- To check out task status: `conqor_q`

- To check out the reason for holding: `condor_q -af HoldReason`

- To remove task:  `condor_rm id`

- To remove all tasks: `condor_rm $USER`
