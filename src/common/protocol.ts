const PacketTypeResize = 'resize';
const PacketTypeData = 'data';

// type PacketType = typeof PacketTypeResize | typeof PacketTypeData;

interface ResizePacket {
  packetType: typeof PacketTypeResize;
  payload: {
    cols: number;
    rows: number;
  };
}

interface DataPacket {
  packetType: typeof PacketTypeData;
  payload: string;
}

type Packet = ResizePacket | DataPacket;

export {
  Packet,
};
