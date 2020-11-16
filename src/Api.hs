{-# LANGUAGE DeriveAnyClass #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE DataKinds #-}

module Api where

import Servant

import Type

-- | server api 
-- query/select a.c from
-- info
type ServerAPI1 = DatabaseApi  :<|> TableApi :<|> StreamApi 


type DatabaseApi =  
       "show"   :> "databases" :> Get '[JSON] [DatabaseInfo]
  :<|> "create" :> "database" :> ReqBody '[JSON] Database :> Post '[JSON] DatabaseInfo
  :<|> "use"    :> Capture "database" DatabaseId :> Get '[JSON] Resp

type TableApi = 
       "show"   :> "tables" :> Get '[JSON] [TableInfo] 
  :<|> "create" :> "table"  :> ReqBody '[JSON] Table :> Post '[JSON] TableInfo
  :<|> "query"  :> "table"  :> Capture "table id" TableId :> Get '[JSON] TableInfo
  :<|> "delete" :> "table"  :> Capture "table id" TableId :> Get '[JSON] Resp

type StreamApi = 
       "show"   :> "streams" :> Get '[JSON] [StreamInfo]
  :<|> "create" :> "stream"  :> ReqBody '[JSON] StreamSql :> Post '[JSON] StreamInfo
  :<|> "query"  :> "stream"  :> Capture "steam id" StreamId :> Get '[JSON] StreamInfo
  :<|> "delete" :> "stream"  :> Capture "steam id" StreamId :> Get '[JSON] Resp





