# API endpoints Version 0.1
This is a list of API endpoints. For Swagger UI, please visit [https://localhost:8000/docs](https://localhost:8000/docs)

## Oauth
### Login
``` python
@router.post(
    "/login/",
    summary="Get access token by given email and password",
    response_description="Access token",
)
```

### Oauth2 login, Azure or Google or Github, etc. `Do we need it`?
``` python
@router.post(
    "/oauth2-login/",
    summary="login via Oauth2"
)
```


### Sign up
``` python
@router.post(
    "/signup/",
    summary="Create an account by given email, full_name and email",
    response_description="Access token",
)
```

### Reset password
``` python
@router.post(
    "/reset-password/",
    summary="Reset password by given new password",
    response_description="Response message of reset password",
)
```

### deactivate
``` python
@router.post(
    "/deactivate/",
    summary="Deactivate account",
    response_description="Response message of deactivate",
)
```

## Users
### Get all users, only for super user
``` python
@router.get(
    "/users/",
    summary="Get all users",
    response_description="A list of active users",
)
```

### Create a new user, only for super user
``` python
@router.post(
    "/users/",
    summary="Create a new user",
    response_description="Created user",
)
```

### Update a user information, e.g., user full name
``` python
@router.put or patch(
    "/users/{user_id}",
    summary="update a new user",
    response_description="updated user",
)
```

### Search a user by user name or email
``` python
@router.get(
    "/users/search/name_or_email",
    summary="search a existing user in the same organization",
    response_description="user",
)
```



## Groups
### Create a group
``` python
@router.post(
    "/groups/",
    summary="Create a group",
    response_description="Created group",
)
```
### Get a list of group
``` python
@router.get(
    "/groups/",
    summary="Create a list of group owned by user",
    response_description="list of groups owned by user",
)
```

### Get a group detals
``` python
@router.get(
    "/groups/{group_id}",
    summary="Create detailed information of a group",
    response_description="group",
)
```

### Update a group detals
``` python
@router.put(
    "/groups/{group_id}",
    summary="Update group information",
    response_description="updated group",
)
```


### Get a group summary
``` python
@router.get(
    "/groups/summary",
    summary="Get a summary of group",
    response_description="# Groups as owner, # groups as member",
)
```

### Get all tasks shared with group {group_id}
``` python
@router.get(
    "/groups/tasks/{group_id}",
    summary="Get all tasks shared with group {group_id}",
    response_description="List of tasks",
)
```


## Medias
### Upload a data file
``` python
@router.post(
    "/medias/upload",
    summary="upload a data file,
    response_description="uploaded data, return at least a id and a checksum, nr columns, preview information, etc",
)
```


## Datasets
### Create a dataset
``` python
@router.post(
    "/datasets/",
    summary="Create a dataset",
    response_description="Created dataset",
)
```
### Get a list of datasets the current user owns or shared
``` python
@router.get(
    "/datasets/",
    summary="get a list of dataset the current user owns or shared",
    response_description="List of dataset",
)
```

### Update a dataset: only name and description are editable
``` python
@router.patch or put(
    "/datasets/{dataset_id}",
    summary="update a dataste name and/or description",
    response_description="Updated dataset",
)
```

### Share a dataset to group or users
``` python
@router.post(
    "/datasets/share/{dataset_id}",
    summary="share a dataset to groups or users; group and user information will be in the input schema",
    response_description="Updated shared information",
)
```



### Delete a dataset
``` python
@router.delete(
    "/datasets/{dataset_id}",
    summary="delete a dataset: delete the resource of the data file, set the is_delete column to True. What about medias table?",
    response_description="Created dataset",
)
```


### Get a dataset summary
``` python
@router.get(
    "/datasets/summary",
    summary="Get a summary of dataset",
    response_description="# uploaded dataset, # shared dataset",
)
```

## NM batch tasks
### Create a batch task
``` python
@router.post(
    "/nm-tasks/batch",
    summary="Create a string matching batch task",
    response_description="Created NM batch task",
)
```

### get all batch task as owner or viewer
``` python
@router.get(
    "/nm-tasks/batch",
    summary="get all batch task as owner or view",
    response_description="list of NM batch task",
)
```


### Get a batch task details
``` python
@router.get(
    "/nm-tasks/batch/{task_id}",
    summary="Get a string matching batch task details",
    response_description="NM batch task",
)
```

### Stop a running batch task
``` python
@router.post(
    "/nm-tasks/batch/stop/{task_id}",
    summary="stop a running task",
    response_description="succed or failed?",
)
```


### Update a batch nm task: only name and description are editable
``` python
@router.patch or put(
    "/nm-tasks/batch/{dataset_id}",
    summary="update a batch nm tasks name and/or description",
    response_description="Updated batch nm task",
)
```

### Delete a batch task
``` python
@router.delete(
    "/nm-tasks/batch/{task_id}",
    summary="delete a batch task",
    response_description="succeed or failed",
)
```


### Get a batch NM task summary
``` python
@router.get(
    "/nm-tasks/batch/summary",
    summary="Get a summary of batch tasks",
    response_description="# completed, running and failed tasks",
)
```

### Get a list RUNNING batch NM tasks which use dataset {dataset_id}
``` python
@router.get(
    "/nm-tasks/batch/active-dataset/{dataset_id}",
    summary="Get a list of batch NM tasks which use dataset {dataset_id}",
    response_description="A list of batch nm tasks",
)
```

### Share a batch nm task to group or users
``` python
@router.post(
    "/nm-tasks/batch/share/{task_id}",
    summary="share a batch string matching task to groups or users; group and user information will be in the input schema",
    response_description="Updated shared information",
)
```

### Get shared group and user of a batch nm task to group
``` python
@router.get(
    "/nm-tasks/batch/share/{task_id}",
    summary="Get shared group and user of a batch nm task to group",
    response_description="shared information",
)
```


### Download a batch nm result. How to download via browser?
``` python
@router.get(
    "/nm-tasks/batch/{task_id}/results/,
    summary="Download the string matching result",
)
```



## NM realtime tasks
### Create a realtime task
``` python
@router.post(
    "/nm-tasks/real-time",
    summary="Create a string matching real-time task",
    response_description="Created NM real-time task",
)
```

### get all real-time task as owner or viewer
``` python
@router.get(
    "/nm-tasks/real-time",
    summary="get all real-time task as owner or view",
    response_description="list of NM real-time task",
)
```


### Get a realtime task details
``` python
@router.get(
    "/nm-tasks/real-time/{task_id}",
    summary="Get a string matching real-time task details",
    response_description="NM real-time task",
)
```

### Stop a running real-time task
``` python
@router.post(
    "/nm-tasks/real-time/stop/{task_id}",
    summary="stop a running task",
    response_description="succed or failed?",
)
```

### Delete a real-time task
``` python
@router.delete(
    "/nm-tasks/real-time/{task_id}",
    summary="delete a real-time task",
    response_description="succeed or failed",
)
```

### Get a real-time NM task summary
``` python
@router.get(
    "/nm-tasks/real-time/summary",
    summary="Get a summary of real-time tasks",
    response_description="# completed, running and failed tasks",
)
```

### Get a list RUNNING real-time NM tasks which use dataset {dataset_id}
``` python
@router.get(
    "/nm-tasks/real-time/active-dataset/{dataset_id}",
    summary="Get a list of real-time NM tasks which use dataset {dataset_id}",
    response_description="A list of real-time nm tasks",
)
```
### Real-time task NM query
``` python
@router.get(
    "/nm-tasks/real-time/{task_id}/q?query_words1&word2",
    summary="real-time nm query",
    response_description="A list of matching result",
)
```

### Share a real-time nm task to group or users
``` python
@router.post(
    "/nm-tasks/real-time/share/{dataset_id}",
    summary="share a real-time string matching task to groups or users; group and user information will be in the input schema",
    response_description="Updated shared information",
)
```

### Download a real-time nm query result. How to download via browser?
``` python
@router.get(
    "/nm-tasks/real-time/{task_id}/results/,
    summary="Download the string matching result",
)
```

### Update a real-time nm task: only name and description, and some search options are editable
``` python
@router.patch or put(
    "/nm-tasks/real-time/{dataset_id}",
    summary="update a real-time nm tasks name and/or description or search options",
    response_description="Updated real-time nm task",
)
```

### Get shared group and user of a real-time nm task to group
``` python
@router.get(
    "/nm-tasks/real-time/share/{task_id}",
    summary="Get shared group and user of a real-time nm task to group",
    response_description="shared information",
)
```

## Pricing, subscription, premium
**To be added**